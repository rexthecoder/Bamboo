import 'package:bamboo/bamboo.dart';
import 'package:flutter/material.dart';

/// Implement a widget that hide based on certain breakpoint based on the bollen values
/// passed to the widget
class BambooHidden extends StatelessWidget {
  const BambooHidden({
    super.key,
    required this.child,
    this.desktop = true,
    this.tablet = true,
    this.mobile = true,
    this.large = true,
  });

  final bool mobile;
  final bool tablet;
  final bool desktop;
  final bool large;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (mobile && context.isMobile) {
      return const SizedBox.shrink();
    }
    if (tablet && context.isTablet) {
      return const SizedBox.shrink();
    }
    if (desktop && context.isDesktop) {
      return const SizedBox.shrink();
    }
    if (large && context.isLarge) {
      return const SizedBox.shrink();
    }
    return child;
  }
}
