import 'package:bamboo/bamboo.dart';
import 'package:example/example/zeus/home_view.dart';
import 'package:example/example/zeus/theme/zeus_colors.dart';
import 'package:flutter/material.dart';

class ZeusApp extends StatelessWidget {
  const ZeusApp({super.key});

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
          useMaterial3: true,
        ),
        home: const HomeView(),
      ),
    );
  }
}
