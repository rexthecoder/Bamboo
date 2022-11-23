import 'package:example/example/zeus/home_view.dart';
import 'package:example/example/zeus/theme/zeus_colors.dart';
import 'package:flutter/material.dart';

class ZeusApp extends StatelessWidget {
  const ZeusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: ZeusColors.primary,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}
