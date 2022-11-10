import 'package:bamboo/foundation/extensions.dart';
import 'package:bamboo/foundation/helpers.dart';
import 'package:flutter/material.dart';

/// Return a responsive value based on the type without context
/// ```dart
/// Responsive(mobile: 20)
/// ```
class BamboomResponsive<T> {
  BamboomResponsive({
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

  /// Adatively provides the assign type with the correct element
  /// based on the current breakpoint
  /// {@tool snippet}
  ///
  /// Here are some examples of how to create [BamboomResponsive.value] instances:
  ///
  /// Mostly, you may need to pass only mobile and large:
  ///
  /// ```dart
  /// BamboomResponsive.value(
  ///    context: context,
  ///    mobile: Colors.amberAccent,
  ///    desktop: Colors.pink,
  ///    tablet: Colors.black,
  ///  )
  /// ```
  /// {@end-tool}
  /// {@tool snippet}
  /// If any of the value non-required value is set to null
  /// it will take the mobile breakpoint as default
  /// See also:
  ///
  ///  * [number], a method which allow set adative [num] values.
  static T value<T>({
    required BuildContext context,
    required T mobile,
    T? tablet,
    T? desktop,
    T? large,
  }) {
    return BamboomResponsive<T>(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      context: context,
    ).adaptive;
  }

  /// Adaptively provides the number based on type with proper unit assign to it
  /// By default the [Unit] objects is just pixel
  /// [Unit] available API are [Unit.p], [Unit.px], [Unit.vh], [Unit.vmax], [Unit.vmin], [Unit.vw]
  static num number<num>({
    required BuildContext context,
    required num mobile,
    num? tablet,
    num? desktop,
    num? large,
    Unit unit = Unit.px,
  }) {
    return BamboomResponsive<num>(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      context: context,
      unit: unit,
    ).adaptive;
  }

  /// Return a responsive value based on the type
  /// ```dart
  /// ResponsiveValue(mobile: 20).value(context)
  /// ```
  T get adaptive {
    if (context.isMobile) {
      return _convertUnit(mobile, unit);
    } else if (context.isTablet) {
      return _convertUnit(tablet, unit) ?? _convertUnit(mobile, unit);
    } else if (context.isDesktop) {
      return _convertUnit(desktop, unit) ?? _convertUnit(mobile, unit);
    } else {
      return _convertUnit(mobile, unit);
    }
  }

  /// Converting the given value to the appropriate unit
  T _convertUnit(value, Unit unitValue) {
    if (unitValue == Unit.p) {
      return value.p;
    } else if (unitValue == Unit.vw) {
      return value.vw;
    } else if (unitValue == Unit.vh) {
      return value.vh;
    } else if (unitValue == Unit.vmin) {
      return value.vmin;
    } else if (unitValue == Unit.vmax) {
      return value.vmax;
    } else if (unitValue == Unit.nan) {
      return value;
    } else {
      return value;
    }
  }
}

@Deprecated("You can use BamboonResponsive.value instead")
T responsiveValue<T>({
  required BuildContext context,
  required T mobile,
  T? tablet,
  T? desktop,
  Unit relativeUnit = Unit.p,
}) {
  return BamboomResponsive<T>(
    mobile: mobile,
    tablet: tablet,
    context: context,
    desktop: desktop,
    unit: relativeUnit,
  ).adaptive;
}

/// Get the current context in flutter
