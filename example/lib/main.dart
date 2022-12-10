import 'package:bamboo/bamboo.dart';
import 'package:example/example/game/game.dart';
import 'package:example/example/zeus/theme/zeus_colors.dart';
import 'package:example/example/zeus/zeus.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_web_plugins/flutter_web_plugins.dart';

// void configureApp() {
//   setUrlStrategy(PathUrlStrategy());
// }

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: ZeusColors.backgroundColor,
    systemNavigationBarDividerColor: ZeusColors.backgroundColor,
    statusBarColor: ZeusColors.backgroundColor,
  ));
  runApp(const GameApp());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BambooBreakPoint(
      mobile: 500,
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
