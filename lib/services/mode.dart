import 'package:flutter/material.dart';

/// Check the current theme mode of the application.
extension ModeExtension on BuildContext {
  /// Returns the current platform brightness of the application.
  Brightness get mode => MediaQuery.of(this).platformBrightness;

  /// Returns true if the current theme mode is dark.
  bool get isDark => mode == Brightness.dark;

  /// Returns true if the current theme mode is light.
  bool get isLight => mode == Brightness.light;
}

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

  T get value {
    if (context.isDark) {
      return dark ?? light;
    } else {
      return light;
    }
  }
}

/// Returns a [Mode] with the same value but with the given context.
/// ```dart
/// final value = Mode<bool>(
/// context: context,
/// light: true,
/// dark: false,
/// );
/// ```
T mode<T>({BuildContext? context, required T light, required T? dark}) {
  return Mode<T>(
    context: context!,
    light: light,
    dark: dark,
  ).value;
}
