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
  bool get isMobile => shortestSide<= breakpoint!.mobile;

  /// Check if screen is tablet
  bool get isTablet =>
      breakpoint!.mobile < shortestSide&& shortestSide<= breakpoint!.tablet;

  /// Check if screen is desktop
  bool get isDesktop => breakpoint!.tablet < shortestSide&& shortestSide<= breakpoint!.desktop;

  /// Extra large
  bool get isLarge => breakpoint!.desktop < shortestSide; 

  /// Return shortestSidebased on orietation
  double get shortestSide => MediaQuery.of(this).size.shortestSide;

  /// Return longestSidebased on orietation
  double get longestSide => MediaQuery.of(this).size.longestSide;

  // Returns the current width 
  double get width => MediaQuery.of(this).size.width;

  // Returns the current height
  double get height => MediaQuery.of(this).size.height;
}


/// Check the current theme mode of the application.
extension ModeExtension on BuildContext {
  /// Returns the current platform brightness of the application.
  Brightness get mode => MediaQuery.of(this).platformBrightness;

  /// Returns true if the current theme mode is dark.
  bool get isDark => mode == Brightness.dark;

  /// Returns true if the current theme mode is light.
  bool get isLight => mode == Brightness.light;
}
