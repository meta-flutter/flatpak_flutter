import 'package:flutter/material.dart';
import 'package:flatpak_flutter/src/messages.g.dart';
import '../services/flatpak_service.dart';

class AppsScreen extends StatefulWidget {
  const AppsScreen({super.key});

  @override
  State<AppsScreen> createState() => _AppsScreenState();
}

class _AppsScreenState extends State<AppsScreen> {
  final FlatpakService _flatpakService = FlatpakService();
  List<Application> _applications = [];
  bool _isLoading = false;
  String _errorMessage = '';
  List<Application> _installedApplications = [];

  @override
  void initState() {
    super.initState();
    _loadApplications();
  }

  Future<void> _loadApplications() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
      _applications = [];
    });
    _getInstalledApplications();
  }

  void _getInstalledApplications() {
    _flatpakService.getApplicationsInstalled().then((apps) {
      setState(() {
        _installedApplications = apps;
        _applications = apps;
        _isLoading = false;
        print('Installed applications: ${_installedApplications.map((app) => app.name).join(', ')}');
      });
    }).catchError((error) {
      setState(() {
        _errorMessage = 'Failed to load installed applications: $error';
        _isLoading = false;
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Installed Apps'),
      ),
      body: _isLoading 
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage.isNotEmpty
              ? Center(child: Text(_errorMessage))
              : _buildApplicationsList(),
    );
  }
  
  Widget _buildApplicationsList() {
    return ListView.builder(
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
        ],
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
}