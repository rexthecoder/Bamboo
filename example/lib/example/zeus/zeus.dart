import 'package:auto_size_text/auto_size_text.dart';
import 'package:bamboo/bamboo.dart';
import 'package:example/example/template/styles.dart';
import 'package:example/example/zeus/home_view.dart';
import 'package:example/example/zeus/theme/zeus_colors.dart';
import 'package:flutter/material.dart';

class ZeusApp extends StatelessWidget {
  const ZeusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BambooBreakPoint(
      tablet: 1000,
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

class NotSupported extends StatelessWidget {
  const NotSupported({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ZeusColors.backgroundColor,
      body: Center(
        child: AutoSizeText(
          'We don\'t support such screen.\nWe are sorry ',
          style: TextStyles.header,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
