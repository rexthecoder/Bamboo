import 'package:flutter/material.dart';

/// Calculate the num and return it responsive value base on unit
/// ```dart
/// final value = 100.p /// 100%
/// final value = 100.px /// 100px
enum Unit { p, vmin, vmax, vw, vh, px, nan }

/// CSS viewport unit from MediaQuerry
extension ViewPointUnit on num {
  /// Return the current context

  static late BuildContext context;

  static void initContext(BuildContext value) {
    context = value;
  }

  /// vmin - percent of smallest between width or height of viewport
  Size get size => MediaQuery.of(context).size;

  /// Return vmin
  num get vmin => this / 100.0 * (size.shortestSide);

  /// vmax - percent of largest between width or height of viewport
  num get vmax => this / 100.0 * size.longestSide;

  /// vw  - percent of viewport width
  num get vw => this / 100.0 * (size.width);

  /// vh  - percent of viewport height
  num get vh => this / 100.0 * (size.height);

  /// Return percentage
  double get p => this * .10;

  /// Returen px
  num get px => this;
}
