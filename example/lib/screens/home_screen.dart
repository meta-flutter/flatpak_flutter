import 'package:flutter/material.dart';
import 'package:flatpak_flutter/src/messages.g.dart';
import '../services/flatpak_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FlatpakService _flatpakService = FlatpakService();
  List<Application> _applications = [];
  bool _isLoading = false;
  String _currentRemote = '';
  String _errorMessage = '';
  List<String> _availableRemotes = [];
  List<Application> _installedApplications = [];

  @override
  void initState() {
    super.initState();
    _loadApplications();
    _getInstalledApplications();
  }

  Future<void> _loadApplications() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
      _applications = [];
      _availableRemotes = [];
    });

    try {
      final List<Installation> systemInstallations = await _flatpakService.getSystemInstallations();
      
      for (Installation installation in systemInstallations) {
        for (Remote remote in installation.remotes) {
          if (!_availableRemotes.contains(remote.name)) {
            _availableRemotes.add(remote.name);
          }
        }
      }

      List<Application> allApplications = [];
      for (Installation installation in systemInstallations) {
        for (Remote remote in installation.remotes) {
          try {
            print('Loading applications from remote: ${remote.name}');
            final applications = await _flatpakService.getApplicationsRemote(remote.name);
            allApplications.addAll(applications);
            print('Loaded ${applications.length} applications from ${remote.name}');
          } catch (e) {
            print('Error loading from remote ${remote.name}: $e');
            setState(() {
              _errorMessage += 'Failed to load from ${remote.name}: $e\n';
            });
          }
        }
      }

      final Map<String, Application> uniqueApps = {};
      for (Application app in allApplications) {
        uniqueApps[app.id] = app;
      }

      setState(() {
        _applications = uniqueApps.values.toList();
        _applications.sort((a, b) => a.name.compareTo(b.name));
      });

    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load applications: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('AGL Store'),
            if (_currentRemote.isNotEmpty)
              Text(
                'Remote: $_currentRemote',
                style: Theme.of(context).textTheme.bodySmall,
              ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8.0),
            color: Theme.of(context).colorScheme.surfaceVariant,
            child: Text(
              _isLoading 
                ? 'Loading applications...' 
                : '${_applications.length} applications found',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),
          
          if (_errorMessage.isNotEmpty)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              color: Theme.of(context).colorScheme.errorContainer,
              child: Text(
                _errorMessage,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onErrorContainer,
                ),
              ),
            ),
          
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _applications.isEmpty
                    ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.apps, size: 64, color: Colors.grey),
                            SizedBox(height: 16),
                            Text('No applications found'),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: _applications.length,
                        itemBuilder: (context, index) {
                          final app = _applications[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                              vertical: 4.0,
                            ),
                            child: ListTile(
                              leading: const Icon(
                                Icons.apps,
                                size: 40,
                                color: Colors.blue,
                              ),
                              title: Text(
                                app.name,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    app.summary,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'ID: ${app.id}',
                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                              trailing: const Icon(Icons.arrow_forward_ios),
                              onTap: () {
                                _showApplicationDetails(app);
                              },
                            ),
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }

  void _showApplicationDetails(Application app) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(app.name),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Summary: ${app.summary}'),
              const SizedBox(height: 8),
              Text('ID: ${app.id}'),
              const SizedBox(height: 8),
              if (app.summary.isNotEmpty) ...[
                Text('Description: ${app.summary}'),
                const SizedBox(height: 8),
              ],
              Text('Version: ${app.version}'),
              const SizedBox(height: 8),
              Text('License: ${app.license}'),
              const SizedBox(height: 8),
              Text('Installed Size: ${app.installedSize}'),
              const SizedBox(height: 8),
              Text('Deployment: ${app.deployDir}'),
              const SizedBox(height: 8),
              Text('Rating Type: ${app.contentRatingType}'),
              const SizedBox(height: 8),
              Text('Content Rating: ${app.contentRating}'),
              const SizedBox(height: 8),
              Text('Latest Commit: ${app.latestCommit}'),
              const SizedBox(height: 8),
              Text('EOL: ${app.eol}'),
              const SizedBox(height: 8),
              Text('EOL Rebase: ${app.eolRebase}'),
              const SizedBox(height: 8),
              Text('Subpath: ${app.subpaths}'),
              const SizedBox(height: 8),
              Text('Metadata: ${app.metadata}'),
              const SizedBox(height: 8),
              Text('Appdata: ${app.appdata}'),
              const SizedBox(height: 8),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
          if(_installedApplications.contains(app))
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _uninstallApplication(app);
              },
              child: const Text('Uninstall'),
            ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              _installApplication(app);
            },
            child: const Text('Install'),
          ),
        ],
      ),
    );
  }

  void _installApplication(Application app) {
    _flatpakService.ApplicationInstall(app.id);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Installing ${app.name}...'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _uninstallApplication(Application app) {
    _flatpakService.ApplicationUninstall(app.id);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Uninstalling ${app.name}...'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _getInstalledApplications() {
    _flatpakService.getApplicationsInstalled().then((apps) {
      setState(() {
        _installedApplications = apps;
      });
    });
  }
}