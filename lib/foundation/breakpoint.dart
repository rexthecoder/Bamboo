import 'package:flutter/material.dart';

/// Breakpoint allows us to pass our breakpoint based on devices
class BambooBreakPoint extends InheritedWidget {
  const  BambooBreakPoint({
    super.key,
    required Widget child,
    this.mobile = 600,
    this.tablet = 900,
    this.desktop = 1200,
  }) : super(child: child);

  final int mobile;
  final int tablet;
  final int desktop;

  static  BambooBreakPoint? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType< BambooBreakPoint>();
  }

  @override
  bool updateShouldNotify( BambooBreakPoint oldWidget) {
    return oldWidget.desktop != desktop ||
        oldWidget.tablet != tablet ||
        oldWidget.mobile != mobile;
  }
}
