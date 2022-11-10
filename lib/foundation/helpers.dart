

import 'package:flutter/animation.dart';

/// Calculate the num and return it responsive value base on unit
/// ```dart
/// final value = 100.p /// 100%
/// final value = 100.px /// 100px
enum Unit { p, vmin, vmax, vw, vh, px, nan }

/// CSS viewport unit from MediaQuerry

extension ViewPointUnit on num {
  /// Return the current context


  /// Return the current size
  Size get size => const Size(200, 100);

  /// Return vmin
  num get vmin => this / 100.0 * (size.shortestSide);

  /// Return vmax
  num get vmax => this / 100.0 * (size.longestSide);

  /// Return vw
  num get vw => this / 100.0 * (size.width);

  /// Return vh
  num get vh => this / 100.0 * (size.height);

  /// Return percentage
  num get p => this * 100.0;

  /// Returen px
  num get px => this;
}

