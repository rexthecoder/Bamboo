import 'package:flutter/material.dart';

/// Breakpoint allows us to pass our breakpoint based on devices
class BambooBreakPoint extends InheritedWidget {
  const BambooBreakPoint({
    super.key,
    required Widget child,
    this.mobile = 576,
    this.tablet = 768,
    this.desktop = 1280,
  }) : super(child: child);

  final int mobile;
  final int tablet;
  final int desktop;

  static BambooBreakPoint of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<BambooBreakPoint>();
    assert(result != null, 'No BambooBreakPoint found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(BambooBreakPoint oldWidget) {
    return oldWidget.mobile != mobile ||
        oldWidget.desktop == desktop ||
        oldWidget.tablet == tablet;
  }
}
