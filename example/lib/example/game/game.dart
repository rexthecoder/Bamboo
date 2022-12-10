import 'package:example/example/game/home_view.dart';
import 'package:example/example/zeus/theme/zeus_colors.dart';
import 'package:flutter/material.dart';

class GameApp extends StatelessWidget {
  const GameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: ZeusColors.backgroundColor,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      title: 'NFTALIEN',
      theme: ThemeData(
        primaryColor: ZeusColors.primary,
        // useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}



