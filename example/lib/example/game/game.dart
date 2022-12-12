import 'package:bamboo/foundation/foundation.dart';
import 'package:example/example/game/home_view.dart';
import 'package:example/example/zeus/theme/zeus_colors.dart';
import 'package:flutter/material.dart';

class GameApp extends StatelessWidget {
  const GameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BambooBreakPoint(
      child: MaterialApp(
        color: ZeusColors.backgroundColor,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        title: 'NFTALIEN',
        theme: ThemeData(
          primaryColor: ZeusColors.primary,
          scrollbarTheme: ScrollbarThemeData(
            thumbColor:MaterialStateProperty.all(
              const Color(
                0xffFFB548,
              ),
            ) ,
            trackColor: MaterialStateProperty.all(
              const Color(
                0xffFFB548,
              ),
            ),
          ),
          useMaterial3: true,
        ),
        home: const HomeView(),
      ),
    );
  }
}
