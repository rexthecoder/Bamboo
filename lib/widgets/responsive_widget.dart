import 'package:flutter/material.dart';
import 'package:bamboo/foundation/extensions.dart';

///Widget that returns a responsive value based on the assign type
class ResponsiveWidget<T> extends StatelessWidget {
  const ResponsiveWidget({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
    this.laptop,
  });

  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;
  final Widget? laptop;

  @override
  Widget build(BuildContext context) {
    if (context.isMobile) {
      return mobile;
    } else if (context.isTablet) {
      return tablet ?? mobile;
    } else if (context.isDesktop) {
      return desktop ?? mobile;
    } else {
      throw Exception('Responsive value not found');
    }
  }
}
