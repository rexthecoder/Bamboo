import 'package:flutter/material.dart';

/// Breakpoint allows us to pass our breakpoint based on devices
class BreakPoint extends InheritedWidget {
  const BreakPoint({
    super.key,
    required Widget child,
    this.mobile = 600,
    this.tablet = 900,
    this.desktop = 1200,
  }) : super(child: child);

  final int mobile;
  final int tablet;
  final int desktop;

  static BreakPoint? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BreakPoint>();
  }

  @override
  bool updateShouldNotify(BreakPoint oldWidget) {
    return oldWidget.desktop != desktop ||
        oldWidget.tablet != tablet ||
        oldWidget.mobile != mobile;
  }
}
