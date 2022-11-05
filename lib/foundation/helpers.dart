import 'package:flutter/material.dart';

/// Allow us to get the currenct context using observers
class ContextObserver extends NavigatorObserver {
  /// The current context
  BuildContext? get context => _context;
  BuildContext? _context;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _context = route.navigator?.context;
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _context = previousRoute?.navigator?.context;
  }
}

/// Calculate the num and return it responsive value base on unit
/// ```dart
/// final value = 100.p /// 100%
/// final value = 100.px /// 100px
enum Unit { p, vmin, vmax, vw, vh, px }

/// CSS viewport unit from MediaQuerry

extension ViewPointUnit on num {
  /// Return the current context
  BuildContext get context => ContextObserver()._context!;

  /// Return the current size
  Size get size => MediaQuery.of(context).size;

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
