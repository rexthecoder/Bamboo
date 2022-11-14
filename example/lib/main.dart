import 'package:bamboo/bamboo.dart';
import 'package:example/example/minimal/minimal.dart';
import 'package:example/foundation.dart';
import 'package:example/hello.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
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
        home: const MinimalWebsite(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
