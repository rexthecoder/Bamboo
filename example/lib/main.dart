import 'package:bamboo/bamboo.dart';
import 'package:example/foundation.dart';
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
        title: 'Flutter Demo',
        navigatorObservers: [BambooObserver()],
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const FoundationWidget(),
      ),
    );
  }
}
