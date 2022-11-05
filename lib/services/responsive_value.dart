import 'package:bamboo/foundation/extensions.dart';
import 'package:bamboo/foundation/helpers.dart';
import 'package:flutter/material.dart';

/// Return a responsive value based on the type without context
/// ```dart
/// Responsive(mobile: 20)
/// ```
class ResponsiveValue<T> {
  ResponsiveValue({
    required this.mobile,
    this.tablet,
    this.desktop,
    this.unit = Unit.p,
  });

  final T mobile;
  final T? tablet;
  final T? desktop;
  final Unit unit;

  final ContextObserver _observer = ContextObserver();

  /// Return a responsive value based on the type
  /// ```dart
  /// ResponsiveValue(mobile: 20).value(context)
  /// ```
  T get value {
    if (_observer.context == null) {
      throw FlutterError('Kindly pass the Bamboo Observer to the Navigator');
    }
    final context = _observer.context!;

    /// Return a value based on the viewpot unit if the value is a type of num

    if (context.isMobile) {
      return _getValue(mobile);
    } else if (context.isTablet) {
      return _getValue(tablet) ?? _getValue(mobile);
    } else if (context.isDesktop) {
      return _getValue(desktop) ?? _getValue(mobile);
    } else {
      throw FlutterError('Responsive value not found');
    }
  }

  _getValue(value) {
    /// if a value is equal to num then it shouw return a value base on the unit assigned
    /// example if Unit == Unit.p then it should return value of percentage
    /// final value = Responsive(unit: Unit.p, mobile: 10) // 100
    /// final value = Responsive(unit: Unit.p, mobile: 10) // 10
    if (T == num) {
      switch (unit) {
        case Unit.p:
          return value.p;
        case Unit.vw:
          return value.vw;
        case Unit.vh:
          return value.vh;
        case Unit.vmin:
          return value.vmin;
        case Unit.vmax:
          return value.vmax;
        case Unit.px:
          return value;
        default:
          return value;
      }
    } else {
      return value;
    }
  }
}

T responsiveValue<T>({
  required T mobile,
  T? tablet,
  T? desktop,
  Unit relativeUnit = Unit.p,
}) {
  return ResponsiveValue<T>(
    mobile: mobile,
    tablet: tablet,
    desktop: desktop,
    unit: relativeUnit,
  ).value;
}
