import 'package:bamboo/foundation/extensions.dart';
import 'package:flutter/material.dart';

/// The current mode of the application.
/// Either the [Brightness.dark] or [Brightness.light].
/// See also:
/// * [ModeExtension]
class Mode<T> {
  const Mode({
    required this.context,
    required this.light,
    this.dark,
  });

  final BuildContext context;
  final T? dark;
  final T light;

  /// Returns a [Mode] with the same value but with the given context.
  /// ```dart
  /// final value = Mode<bool>(
  /// context: context,
  /// light: true,
  /// dark: false,
  /// );
  /// ```
  static T only<T>({
    required BuildContext context,
    required T light,
    required T? dark,
  }) {
    return Mode<T>(
      context: context,
      light: light,
      dark: dark,
    ).value;
  }

  static T all<T>({
    required BuildContext context,
    required T value,
  }) {
    return Mode<T>(
      context: context,
      light: value,
      dark: value,
    ).value;
  }

  T get value {
    if (context.isDark) {
      return dark ?? light;
    } else {
      return light;
    }
  }
}
