import 'package:flatpak_flutter/src/messages.g.dart';
import 'package:flutter/material.dart';
import 'package:ini/ini.dart';
import 'package:xml/xml.dart';
import 'package:xml/xpath.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _version = "";
  String _defaultArch = "";
  List<String?> _supportedArches = List.empty();

  final api = FlatpakApi();

  void _printRemote(String tag, Remote remote) {
    final name = remote.name;
    final url = remote.url;
    final collectionId = remote.collectionId;
    final title = remote.title;
    final comment = remote.comment;
    final description = remote.description;
    final homepage = remote.homepage;
    final icon = remote.icon;
    final defaultBranch = remote.defaultBranch;
    final mainRef = remote.mainRef;
    final remoteType = remote.remoteType;
    final filter = remote.filter;
    final appstreamTimestamp = DateTime.parse(remote.appstreamTimestamp);
    final appstreamDir = remote.appstreamDir;
    final gpgVerify = remote.gpgVerify;
    final noEnumerate = remote.noEnumerate;
    final noDeps = remote.noDeps;
    final disabled = remote.disabled;
    final prio = remote.prio;

    if (tag.isNotEmpty) {
      print("\t[$tag]");
    }
    if (name.isNotEmpty) {
      print("\tname: $name");
    }
    if (url.isNotEmpty) {
      print("\turl: $url");
    }
    if (collectionId.isNotEmpty) {
      print("\tcollectionId: $collectionId");
    }
    if (title.isNotEmpty) {
      print("\ttitle: $title");
    }
    if (comment.isNotEmpty) {
      print("\tcomment: $comment");
    }
    if (description.isNotEmpty) {
      print("\tdescription: $description");
    }
    if (homepage.isNotEmpty) {
      print("\thomepage: $homepage");
    }
    if (icon.isNotEmpty) {
      print("\ticon: $icon");
    }
    if (defaultBranch.isNotEmpty) {
      print("\tdefaultBranch: $defaultBranch");
    }
    if (mainRef.isNotEmpty) {
      print("\tmainRef: $mainRef");
    }
    if (remoteType.isNotEmpty) {
      print("\tremoteType: $remoteType");
    }
    if (filter.isNotEmpty) {
      print("\tfilter: $filter");
    }
    print("\tappstreamTimestamp: $appstreamTimestamp");
    if (appstreamDir.isNotEmpty) {
      print("\tappstreamDir: $appstreamDir");
    }
    print("\tgpgVerify: $gpgVerify");
    print("\tnoEnumerate: $noEnumerate");
    print("\tnoDeps: $noDeps");
    print("\tdisabled: $disabled");
    print("\tprio: $prio");
  }

  void _printInstallation(String tag, Installation installation) {
    final id = installation.id;
    final displayName = installation.displayName;
    final path = installation.path;
    final noInteraction = installation.noInteraction;
    final isUser = installation.isUser;
    final priority = installation.priority;
    if (tag.isNotEmpty) {
      print("[$tag]");
    }
    if (id.isNotEmpty) {
      print("id: $id");
    }
    if (displayName.isNotEmpty) {
      print("display_name: $displayName");
    }
    if (path.isNotEmpty) {
      print("path: $path");
    }
    print("noInteraction: $noInteraction");
    print("isUser: $isUser");
    print("priority: $priority");
    final defaultLanaguages = installation.defaultLanaguages;
    for (String language in defaultLanaguages) {
      if (language.isNotEmpty) {
        print("language: $language");
      }
    }
    final defaultLocales = installation.defaultLocale;
    for (String locale in defaultLocales) {
      if (locale.isNotEmpty) {
        print("locale: $locale");
      }
    }
    final remotes = installation.remotes;
    final count = installation.remotes.length;
    print("Remote Count: $count");
    for (Remote remote in remotes) {
      _printRemote("Remote", remote);
    }
  }

  String? _xPathQuery(XmlDocument document, String query) {
    final nodes = document.xpath(query);
    for (final node in nodes) {
      if (node.nodeType == XmlNodeType.ATTRIBUTE) {
        return node.value.toString();
      } else if (node.nodeType == XmlNodeType.ELEMENT) {
        return node.firstChild.toString();
      }
    }
    return null;
  }

  String? _getDesktopIdFilePath(String desktopId) {
    final environment = Platform.environment;
    if (!environment.containsKey("XDG_DATA_DIRS")) {
      print('XDG_DATA_DIRS is not set.');
      return null;
    }
    final xdgDataDirs = environment["XDG_DATA_DIRS"];
    if (xdgDataDirs != null) {
      final dirs = xdgDataDirs.split(":");
      for (String dir in dirs) {
        String path = "$dir/applications/$desktopId";
        if (File(path).existsSync()) {
          return path;
        }
      }
    }
    return null;
  }

  void _incrementCounter() async {
    _version = await api.getVersion();
    _defaultArch = await api.getDefaultArch();
    _supportedArches = await api.getSupportedArches();

    final systemInstallations = await api.getSystemInstallations();
    for (Installation installation in systemInstallations) {
      _printInstallation("System Installation", installation);
    }

    final installation = await api.getUserInstallation();
    _printInstallation("User Installation", installation);

    final applications = await api.getApplicationsInstalled();
    for (Application application in applications) {
      final name = application.name;
      final id = application.id;
      final summary = application.summary;
      final version = application.version;
      final origin = application.origin;
      final license = application.license;
      final installedSize = application.installedSize;
      final deployDir = application.deployDir;
      final isCurrent = application.isCurrent;
      final contentRatingType = application.contentRatingType;
      final latestCommit = application.latestCommit;
      final eol = application.eol;
      final eolRebase = application.eolRebase;
      final subpaths = application.subpaths;

      print("[Application]");
      print("name: $name");
      print("id: $id");
      print("summary: $summary");
      print("version: $version");
      print("origin: $origin");
      print("license: $license");
      final installedSizeMb = installedSize / (1024 * 1024);
      String installSizeMbString = installedSizeMb.toStringAsFixed(2);
      print("installed_size: $installSizeMbString MB");
      print("deploy_dir: $deployDir");
      print("is_current: $isCurrent");
      print("content_rating_type: $contentRatingType");
      print("latest_commit: $latestCommit");
      print("eol: $eol");
      print("eol_rebase: $eolRebase");
      for (String subpath in subpaths) {
        print("subpath: $subpath");
      }

      if (application.metadata.isNotEmpty) {
        final metaData = Config.fromStrings(application.metadata.split('\n'));
        print("metadata:");
        final sections = metaData.sections();
        for (String section in sections) {
          print("\tsection: $section");
        }
      }

      if (application.appdata.isNotEmpty) {
        final document = XmlDocument.parse(application.appdata);
        print("appdata");

        final origin = _xPathQuery(document, "//components[1]/@origin");
        final version = _xPathQuery(document, "//components[1]/@version");
        final type =
            _xPathQuery(document, "//components[1]/component[1]/@type");
        final id = _xPathQuery(document, "//components[1]/component[1]/id");
        final name =
            _xPathQuery(document, "//components[1]/component[1]/name[not(@*)]");
        final summary = _xPathQuery(
            document, "//components[1]/component[1]/summary[not(@*)]");
        final description = _xPathQuery(
            document, "//components[1]/component[1]/description[not(@*)]/p");

        final pkgname =
            _xPathQuery(document, "//components[1]/component[1]/pkgname");
        final sourcePkgname = _xPathQuery(
            document, "//components[1]/component[1]/source_pkgname");
        final projectLicense = _xPathQuery(
            document, "//components[1]/component[1]/project_license");

        if (origin != null && origin.isNotEmpty) {
          print("\torigin: $origin");
        }
        if (version != null && version.isNotEmpty) {
          print("\tversion: $version");
        }
        if (type != null && type.isNotEmpty) {
          print("\ttype: $type");
        }
        if (id != null && id.isNotEmpty) {
          print("\tid: $id");
        }
        if (name != null && name.isNotEmpty) {
          print("\tname: $name");
        }
        if (summary != null && summary.isNotEmpty) {
          print("\tsummary: $summary");
        }
        if (description != null && description.isNotEmpty) {
          print("\tdescription: $description");
        }
        if (pkgname != null && pkgname.isNotEmpty) {
          print("\tpkgname: $pkgname");
        }
        if (sourcePkgname != null && sourcePkgname.isNotEmpty) {
          print("\tsourcePkgname: $sourcePkgname");
        }
        if (projectLicense != null && projectLicense.isNotEmpty) {
          print("\tprojectLicense: $projectLicense");
        }

        if (type == "desktop" || type == "desktop-application") {
          final iconFile = _xPathQuery(document,
              "//components[1]/component[1]/icon[@type='cached' and @height='64' and @width='64']");
          final iconPath =
              "$deployDir/files/share/app-info/icons/flatpak/64x64/${iconFile!}";
          if (File(iconPath).existsSync()) {
            print("\ticon: $iconPath");
          } else {
            print("Icon 64x64 file is missing.");
          }

          final desktopId = _xPathQuery(document,
              "//components[1]/component[1]/launchable[@type='desktop-id']");
          if (desktopId != null && desktopId.isNotEmpty) {
            final desktopIdFilePath = _getDesktopIdFilePath(desktopId);
            if (desktopIdFilePath != null && desktopIdFilePath.isNotEmpty) {
              print("\tlaunchable: $desktopIdFilePath");
              File(desktopIdFilePath)
                  .readAsLines()
                  .then((lines) => Config.fromStrings(lines))
                  .then((value) {
                final sections = value.sections();
                print("desktopId:");
                for (String section in sections) {
                  print("\tsection: $section");
                }
              });
            }
          }
        }
      }
    }

    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Version:',
            ),
            Text(
              _version,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Text(
              'Default Arch:',
            ),
            Text(
              _defaultArch,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Text(
              'Supported Arches:',
            ),
            Text(
              _supportedArches.toString(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
