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
    this.large,
    required this.context,
    this.unit = Unit.p,
  });

  final T mobile;
  final T? tablet;
  final T? desktop;
  final T? large;
  final Unit unit;
  final BuildContext context;

  /// Return a responsive value based on the type
  /// ```dart
  /// ResponsiveValue(mobile: 20).value(context)
  /// ```
  T get value {
    // final context =BuildContext()!;

    if (context.isMobile) {
      return _getValue(mobile);
    } else if (context.isTablet) {
      return _getValue(tablet) ?? _getValue(mobile);
    } else if (context.isDesktop) {
      return _getValue(desktop) ?? _getValue(mobile);
    } else {
      return _getValue(mobile);
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
  required BuildContext context,
  required T mobile,
  T? tablet,
  T? desktop,
  Unit relativeUnit = Unit.p,
}) {
  return ResponsiveValue<T>(
    mobile: mobile,
    tablet: tablet,
    context: context,
    desktop: desktop,
    unit: relativeUnit,
  ).value;
}


/// Get the current context in flutter 

