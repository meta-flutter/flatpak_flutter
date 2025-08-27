import 'package:flatpak_flutter_example/responsive.dart';
import 'package:flatpak_flutter_example/screens/category_screen.dart';
import 'package:flatpak_flutter_example/services/search_service.dart';
import 'package:flatpak_flutter_example/widgets/app_card.dart';
import 'package:flutter/material.dart';
import 'package:flatpak_flutter/src/messages.g.dart';

import '../services/flatpak_service.dart';

class CategorySection extends StatefulWidget {
  const CategorySection({
    super.key,
    required this.category_heading,
    required this.apps,
    required this.onTap,
  });

  final String category_heading;
  final List<Application> apps;
  final Function(Application) onTap;

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  final FlatpakService _flatpakService = FlatpakService();
  final SearchService _searchService = SearchService();
  final Set<String> _installingApps = <String>{};
  final Map<String, bool> _installationStatus = <String, bool>{};


  @override
  void initState() {
    super.initState();
    _initializeInstallationStatus();
  }

  void _initializeInstallationStatus() {
    for (final app in widget.apps) {
      _installationStatus[app.id] = _searchService.isAppInstalled(app);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.category_heading,
                style: TextStyle(
                  color: const Color(0xFF111827),
                  fontSize: Responsive.scale(context, 24).clamp(16, 28),
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryScreen(
                      category: widget.category_heading,
                    ),
                  ),
                ),
                child: Text(
                  "See All",
                  style: TextStyle(
                    color: const Color(0xFF2563EB),
                    fontSize: Responsive.scale(context, 20).clamp(14, 24),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 234,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: widget.apps.length,
            itemBuilder: (context, index) {
              final item = widget.apps[index];
              final isInstalling = _installingApps.contains(item.id);
              final isInstalled = _searchService.isAppInstalled(item);

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: AppCard(
                  application: item,
                  onTap: () => widget.onTap(item),
                  onInstall: () => _handleInstallTap(item),
                  isInstalled: isInstalled,
                  isInstalling: isInstalling,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Future<void> _handleInstallTap(Application app) async {
    if (_installingApps.contains(app.id)) {
      return;
    }

    final isInstalled = _searchService.isAppInstalled(app);

    if (isInstalled) {
      _openApplication(app);
    } else {
      await _installApplication(app);
    }
  }

  Future<void> _installApplication(Application app) async {
    setState(() {
      _installingApps.add(app.id);
    });

    try {
      await _flatpakService.ApplicationInstall(app.id);
      await Future.delayed(const Duration(seconds: 2));
      await _searchService.refreshInstallationStatus(app.id);

      if (mounted) {
        setState(() {
          _installationStatus[app.id] = true;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${app.name} installed successfully!'),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 2),
          ),
        );
      }

    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to install ${app.name}: $e'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _installingApps.remove(app.id);
        });
      }
    }
  }

  void _openApplication(Application app) {
    // TODO: Implement app opening logic
  }
}