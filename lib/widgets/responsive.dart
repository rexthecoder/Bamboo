import 'package:flutter/material.dart';
import 'package:bamboo/foundation/extensions.dart';

///Widget that returns a responsive value based on the assign type
class BambooWidget<T> extends StatelessWidget {
  const BambooWidget({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
    this.large,
  });

  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;
  final Widget? large;

  @override
  Widget build(BuildContext context) {
    if (context.isMobile) {
      return mobile;
    } else if (context.isTablet) {
      return tablet ?? mobile;
    } else if (context.isDesktop) {
      return desktop ?? mobile;
    } else if (context.isLarge) {
      return desktop ?? mobile;
    } else {
      throw FlutterError('Responsive value not found');
    }
  }
}
