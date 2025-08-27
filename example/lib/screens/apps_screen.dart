
import 'package:flatpak_flutter_example/services/search_service.dart';
import 'package:flutter/material.dart';
import 'package:flatpak_flutter/src/messages.g.dart';
import '../services/flatpak_service.dart';
import '../widgets/appscreen_content.dart';
import '../widgets/appscreen_head.dart';

class AppsScreen extends StatefulWidget {
  const AppsScreen({super.key,required this.application,});
  final Application application;



  @override
  State<AppsScreen> createState() => _AppsScreenState();
}

class _AppsScreenState extends State<AppsScreen> {
  final FlatpakService _flatpakService = FlatpakService();
  final SearchService _SearchService = SearchService();
  final bool _isLoading = false;
  final String _errorMessage = '';


  bool _isInitialized = true;

  @override
  void initState() {
    super.initState();
    _initializedata();
  }

  Future<void> _initializedata() async {
    setState(() {
      _isInitialized = true;
    });

    try{
      await _SearchService.init();
    }catch(e){
      print('error in initialize search: $e');
    }

    setState(() {
      _isInitialized = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppscreanHead(appname: widget.application.name,
      ) ,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(24.0),
        child: Container(
            child: AppscreenContent(app: widget.application,),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);

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