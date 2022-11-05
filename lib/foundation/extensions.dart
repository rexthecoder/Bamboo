import 'package:bamboo/foundation/breakpoint.dart';
import 'package:flutter/material.dart';

/// Extension to define all our screen utilities
extension ResponsiveUtil on BuildContext {
  Size get size => MediaQuery.of(this).size;

  /// Return breakpoints value
  BreakPoint? get breakpoint => BreakPoint.of(this);

  /// Return orientation
  Orientation get orientation => MediaQuery.of(this).orientation;

  /// Check if screen is portrait
  bool get isPortrait => orientation == Orientation.portrait;

  /// Check if screen is landscape
  bool get isLandscape => orientation == Orientation.landscape;

  /// Check if screen is mobile
  bool get isMobile => width < breakpoint!.mobile;

  /// Check if screen is tablet
  bool get isTablet => width >=  breakpoint!.mobile && width <  breakpoint!.tablet;

  /// Check if screen is desktop
  bool get isDesktop => width >= breakpoint!.tablet && width <breakpoint!.desktop;

  /// Return width based on orietation
  double get width => isPortrait ? size.width : size.height;

  /// Return height based on orietation
  double get height => isPortrait ? size.height : size.width;
}
