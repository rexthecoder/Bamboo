import 'package:bamboo/bamboo.dart';
import 'package:example/example/zeus/theme/zeus_colors.dart';
import 'package:example/example/zeus/zeus.dart';

// import 'package:example/example/zeus/zeus.dart' deferred as box;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void configureApp() {
  setUrlStrategy(PathUrlStrategy());
}

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: ZeusColors.backgroundColor,
    systemNavigationBarDividerColor: ZeusColors.backgroundColor,
    statusBarColor: ZeusColors.backgroundColor,
  ));
  configureApp();
  runApp(const ZeusApp());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BambooBreakPoint(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        // showPerformanceOverlay: true,
        title: 'Flutter Demo',
        home: const ZeusApp(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}

// class MainPage extends StatelessWidget {
//   const MainPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<void>(
//       future: box.loadLibrary(),
//       builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           }
//           return box.ZeusApp();
//         }
//         return const CircularProgressIndicator(
//           color: Colors.red,
//         );
//       },
//     );
//   }
// }
