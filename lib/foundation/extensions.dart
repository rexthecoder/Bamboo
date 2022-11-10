import 'package:bamboo/foundation/breakpoint.dart';
import 'package:flutter/material.dart';

/// Extension to define all our screen utilities
extension ResponsiveUtil on BuildContext {
  Size get size => MediaQuery.of(this).size;

  /// Return breakpoints value
  BambooBreakPoint? get breakpoint => BambooBreakPoint.of(this);

  /// Return orientation
  Orientation get orientation => MediaQuery.of(this).orientation;

  /// Check if screen is portrait
  bool get isPortrait => orientation == Orientation.portrait;

  /// Check if screen is landscape
  bool get isLandscape => orientation == Orientation.landscape;

  /// Check if screen is mobile using breakpoint both landscape and portrait
  bool get isMobile => width <= breakpoint!.mobile;

  /// Check if screen is tablet
  bool get isTablet =>
      breakpoint!.mobile < width && width <= breakpoint!.tablet;

  /// Check if screen is desktop
  bool get isDesktop => breakpoint!.tablet < width && width <= breakpoint!.desktop;

  /// Extra large
  bool get isLarge => breakpoint!.desktop < width; 

  /// Return width based on orietation
  double get width => MediaQuery.of(this).size.width;

  /// Return height based on orietation
  double get height => MediaQuery.of(this).size.height;
}
