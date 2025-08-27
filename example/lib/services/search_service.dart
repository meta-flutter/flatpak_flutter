import 'package:flutter/foundation.dart';

import 'flatpak_service.dart';
import 'package:flatpak_flutter/src/messages.g.dart';

class SearchService {
  static final SearchService _instance = SearchService._internal();
  factory SearchService() => _instance;
  SearchService._internal();

  final FlatpakService _flatpakService = FlatpakService();
  List<Application> _applications = [];
  List<String> _availableRemotes = [];
  List<Application> _installedApplications = [];
  String _errorMessage = '';
  bool _isLoading = false;

  List<Application> get applications => _applications;
  List<String> get availableRemotes => _availableRemotes;
  List<Application> get installedApplications => _installedApplications;
  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  Future<void> init() async {
    await _loadapps();
    await _getInstalledapps();
  }

  Future<void> _loadapps() async {
    _isLoading = true;
    _errorMessage = '';
    _applications = [];
    _availableRemotes = [];

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
            if (kDebugMode) {
              print('Loading applications from remote: ${remote.name}');
            }
            final applications = await _flatpakService.getApplicationsRemote(remote.name);
            allApplications.addAll(applications);
            if (kDebugMode) {
              print('Loaded ${applications.length} applications from ${remote.name}');
            }
          } catch (e) {
            if (kDebugMode) {
              print('Error loading from remote ${remote.name}: $e');
            }
            _errorMessage += 'Failed to load from ${remote.name}: $e\n';
          }
        }
      }

      final Map<String, Application> uniqueapps = {};
      for (Application app in allApplications) {
        uniqueapps[app.id] = app;
      }

      _applications = uniqueapps.values.toList();
      _applications.sort((a, b) => a.name.compareTo(b.name));

    } catch (e) {
      _errorMessage = 'Failed to load applications: $e';
    } finally {
      _isLoading = false;
    }
  }

  Future<void> _getInstalledapps() async {
    try {
      _installedApplications = await _flatpakService.getApplicationsInstalled();
    } catch (e) {
      if (kDebugMode) {
        print('Error getting installed apps: $e');
      }
    }
  }

  List<Application> searchForApp(String search) {
    search = search.toLowerCase();
    return _applications.where((app) {
      String appName = app.name.toLowerCase();
      return appName.contains(search);
    }).toList();
  }

  Application? findApp(String name) {
    name = name.toLowerCase();
    try {
      return _applications.firstWhere((app) {
        String appName = app.name.toLowerCase();
        return appName == name;
      });
    } catch (e) {
      return null;
    }
  }

  Application? findAppById(String id) {
    try {
      return _applications.firstWhere((app) => app.id == id);
    } catch (e) {
      return null;
    }
  }

  List<Application> getTagApps(List<String> ids) {
    List<Application> apps = [];
    for (String id in ids) {
      Application? app = findAppById(id);
      if (app != null) {
        apps.add(app);
      }
    }
    return apps;
  }

  bool isAppInstalled(Application app) {
    return _installedApplications.any((installedApp) => installedApp.id == app.id);
  }

  Future<void> refreshInstallationStatus(String appId) async {
    try {
      _installedApplications = await _flatpakService.getApplicationsInstalled();
      if (kDebugMode) {
        print('Refreshed installation status for app: $appId');
        print('Total installed apps: ${_installedApplications.length}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error refreshing installation status: $e');
      }
    }
  }

  Future<bool> checkAppInstallationStatus(String appId) async {
    try {
      final installedApps = await _flatpakService.getApplicationsInstalled();
      return installedApps.any((app) => app.id == appId);
    } catch (e) {
      if (kDebugMode) {
        print('Error checking installation status for $appId: $e');
      }
      return false;
    }
  }

  Future<void> forceRefreshInstalled() async {
    await _getInstalledapps();
  }

  // Refresh data
  Future<void> refresh() async {
    await init();
  }
}