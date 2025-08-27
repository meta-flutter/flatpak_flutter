import 'dart:core';
import 'package:flatpak_flutter_example/screens/apps_screen.dart';
import 'package:flatpak_flutter_example/widgets/cateogry_section.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../widgets/top_bar.dart';
import 'package:flatpak_flutter/src/messages.g.dart';
import '../services/flatpak_service.dart';
import 'package:flatpak_flutter_example/services/search_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FlatpakService _flatpakService = FlatpakService();
  final SearchService _SearchService = SearchService();

  bool _isInitialized = true;

  static const List<String> popularAppIds = [
    'org.mozilla.firefox',
    'com.google.Chrome',
    'com.visualstudio.code',
    'com.spotify.Client',
    'com.discordapp.Discord',
    'org.libreoffice.LibreOffice',
    'org.gimp.GIMP',
    'org.telegram.desktop',
    'org.videolan.VLC',
    'com.obsproject.Studio',
    'com.valvesoftware.Steam',
    'org.blender.Blender',
    'org.audacityteam.Audacity',
    'org.inkscape.Inkscape',
    'md.obsidian.Obsidian',
    'org.mozilla.Thunderbird',
    'com.github.phase1geo.minder',
    'org.gnome.TextEditor',
    'org.filezilla_project.Filezilla',
    'org.qbittorrent.qBittorrent'
  ];

  static const List<String> productivityAppIds = [
    'org.libreoffice.LibreOffice',
    'com.wps.Office',
    'md.obsidian.Obsidian',
    'com.slack.Slack',
    'com.microsoft.Teams',
    'us.zoom.Zoom',
    'com.dropbox.Client',
    'com.nextcloud.desktopclient.nextcloud',
    'org.mozilla.Thunderbird',
    'org.gnome.Evolution',
    'org.gnome.Calendar',
    'org.gnome.Contacts',
    'com.github.phase1geo.minder',
    'org.gnome.TextEditor',
    'com.github.marktext.marktext',
    'org.gnome.Notes',
    'org.typora.Typora',
    'com.github.muriloventuroso.easyssh',
    'org.filezilla_project.Filezilla',
    'com.github.alecaddd.sequeler'
  ];

  static const List<String> graphicsPhotographyAppIds = [
    'org.blender.Blender',
    'org.krita.Krita',
    'com.adobe.Flash-Player-Projector',
    'org.shotcut.Shotcut',
    'com.github.johnfactotum.Foliate',
    'org.gnome.design.Palette',
    'org.freecadweb.FreeCAD',
    'org.sweethome3d.SweetHome3D',
    'com.github.maoschanz.drawing',
    'org.gmic.gmic_krita_qt',
    'com.github.weclaw1.ImageRoll',
    'org.gnome.eog',
    'org.nomacs.ImageLounge',
    'com.github.tchx84.Flatseal',
    'org.photoqt.PhotoQt'
  ];

  static const List<String> audioVideoAppIds = [
    'org.videolan.VLC',
    'com.obsproject.Studio',
    'org.audacityteam.Audacity',
    'org.shotcut.Shotcut',
    'com.spotify.Client',
    'org.gnome.Rhythmbox3',
    'org.clementine_player.Clementine',
    'org.gnome.SoundRecorder',
    'fr.handbrake.ghb',
    'io.github.seadve.Kooha',
    'org.gnome.Totem',
    'org.kde.kdenlive',
    'org.openshot.OpenShot',
    'org.jitsi.jitsi-meet',
    'com.github.wwmm.easyeffects',
    'org.mpv.Mpv',
    'io.github.celluloid_player.Celluloid',
    'org.gnome.Podcasts',
    'org.pitivi.Pitivi',
    'com.github.artemanufrij.playmymusic'
  ];

  static const List<String> educationAppIds = [
    'org.gnu.octave',
    'com.github.gi_lom.dialect',
    'org.gnome.Calculator',
    'org.tuxpaint.Tuxpaint',
    'org.celestia.Celestia',
    'org.goldendict.GoldenDict',
    'org.gnome.Dictionary',
    'com.github.johnfactotum.Foliate',
    'org.marble.marble',
    'org.gnome.Klotski',
    'org.gnome.Sudoku',
    'org.gnome.Chess'
  ];

  static const List<String> developmentAppIds = [
    'com.visualstudio.code',
    'org.gnome.Builder',
    'com.jetbrains.IntelliJ-IDEA-Community',
    'com.jetbrains.PyCharm-Community',
    'org.eclipse.Java',
    'io.atom.Atom',
    'com.sublimetext.three',
    'org.vim.Vim',
    'org.gnome.TextEditor',
    'com.github.marktext.marktext',
    'org.kde.kate',
    'org.gnome.gitg',
    'com.github.gi_lom.dialect',
    'org.wireshark.Wireshark',
    'com.getpostman.Postman',
    'org.dbeaver.DBeaver',
    'com.github.alecaddd.sequeler',
    'org.gnome.meld',
    'com.github.muriloventuroso.easyssh',
    'org.filezilla_project.Filezilla'
  ];

  static const List<String> gamingAppIds = [
    'com.valvesoftware.Steam',
    'com.discordapp.Discord',
    'org.mamedev.MAME',
    'org.DolphinEmu.dolphin-emu',
    'org.gnome.Chess',
    'org.gnome.Mahjongg',
    'org.gnome.Mines',
    'org.gnome.Sudoku',
    'org.gnome.Klotski',
    'org.frozen_bubble.frozen-bubble',
    'org.gnome.Quadrapassel',
    'org.gnome.Nibbles',
    'org.supertux.SuperTux',
    'org.supertuxkart.SuperTuxKart',
    'net.sourceforge.ExtremeTuxRacer',
    'org.openttd.OpenTTD',
    'org.wesnoth.Wesnoth',
    'io.github.retux_game.retux'
  ];

  static const List<String> systemToolsAppIds = [
    'org.bleachbit.BleachBit',
    'org.gnome.Terminal',
    'com.raggesilver.BlackBox',
    'org.filezilla_project.Filezilla',
    'com.github.muriloventuroso.easyssh',
    'org.wireshark.Wireshark',
    'org.fedoraproject.MediaWriter',
    'org.etcher.Etcher',
    'com.github.unrud.VideoDownloader'
  ];

  static const List<String> socialCommunicationAppIds = [
    'com.discordapp.Discord',
    'org.telegram.desktop',
    'com.slack.Slack',
    'org.jitsi.jitsi-meet',
    'org.signal.Signal',
    'com.skype.Client',
    'org.gnome.Fractal',
    'io.element.Element',
    'com.github.bleakgrey.tootle',
    'org.mozilla.Thunderbird',
    'org.gnome.Evolution',
    'com.github.johnfactotum.Foliate',
    'org.gnome.Contacts',
    'org.kde.kdeconnect.kcm',
    'com.github.wwmm.easyeffects',
    'org.gnome.Empathy',
    'org.pidgin.Pidgin',
    'com.github.gi_lom.dialect'
  ];

  static const List<String> internetBrowsersAppIds = [
    'org.mozilla.firefox',
    'com.google.Chrome',
    'org.chromium.Chromium',
    'com.microsoft.Edge',
    'com.brave.Browser',
    'org.torproject.torbrowser-launcher',
    'org.qutebrowser.qutebrowser',
    'com.github.Eloston.UngoogledChromium',
    'org.gnome.Epiphany',
    'org.kde.falkon',
    'com.opera.Opera',
    'org.mozilla.Thunderbird',
    'org.filezilla_project.Filezilla',
    'org.qbittorrent.qBittorrent',
    'com.transmissionbt.Transmission',
    'org.deluge_torrent.deluge',
    'com.github.unrud.VideoDownloader',
    'org.gnome.Fragments',
    'net.sourceforge.jstest-gtk',
    'org.remmina.Remmina'
  ];

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
      if (kDebugMode) {
        print('error in initialize search: $e');
      }
    }
    
    setState(() {
      _isInitialized = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Application> popularApps = _SearchService.getTagApps(popularAppIds);
    List<Application> productivityApps = _SearchService.getTagApps(productivityAppIds);
    List<Application> graphicsApps = _SearchService.getTagApps(graphicsPhotographyAppIds);
    List<Application> videoApps = _SearchService.getTagApps(audioVideoAppIds);
    List<Application> educationApps = _SearchService.getTagApps(educationAppIds);
    List<Application> devApps = _SearchService.getTagApps(developmentAppIds);
    List<Application> gamingApps = _SearchService.getTagApps(gamingAppIds);
    List<Application> systemApps = _SearchService.getTagApps(systemToolsAppIds);
    List<Application> socialApps = _SearchService.getTagApps(socialCommunicationAppIds);
    List<Application> browserApps = _SearchService.getTagApps(internetBrowsersAppIds);


    return Scaffold(
      appBar: const AppTopBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 32),
            CategorySection(
              category_heading: "Popular Apps",
              apps: popularApps,
              onTap: _toAppScreen,
            ),
            SizedBox(height: 32),
            CategorySection(
              category_heading: "Productivity",
              apps: productivityApps,
              onTap:  _toAppScreen,
            ),

            SizedBox(height: 32),
            CategorySection(
              category_heading: "Graphics & Photography",
              apps: graphicsApps,
              onTap:  _toAppScreen,
            ),

            SizedBox(height: 32),
            CategorySection(
              category_heading: "Audio & Video",
              apps: videoApps,
              onTap:  _toAppScreen,
            ),

            SizedBox(height: 32),
            CategorySection(
              category_heading: "Education",
              apps: educationApps,
              onTap:  _toAppScreen,
            ),

            SizedBox(height: 32),
            CategorySection(
              category_heading: "Development",
              apps: devApps,
              onTap:  _toAppScreen,
            ),

            SizedBox(height: 32),
            CategorySection(
              category_heading: "Gaming",
              apps: gamingApps,
              onTap:  _toAppScreen,
            ),


            SizedBox(height: 32),
            CategorySection(
              category_heading: "System Tools",
              apps: systemApps,
              onTap:  _toAppScreen,
            ),


            SizedBox(height: 32),
            CategorySection(
              category_heading: "Social",
              apps: socialApps,
              onTap:  _toAppScreen,
            ),

            SizedBox(height: 32),
            CategorySection(
              category_heading: "Internet Browsers",
              apps: browserApps,
              onTap:  _toAppScreen,
            ),


          ],
        ),
      ),
    );
  }

  void _toAppScreen(Application app){
    Navigator.push(context,
    MaterialPageRoute(
        builder: (context)=>AppsScreen(application:app),
    ),
    );
  }

  /// TODO : Get Button
  /// Should make a modern dragger widget to get app bottom sheet when pressing "Get" button
  /// If Application is Already installed "Get" button => "open" button


}