import 'package:flutter/material.dart';

class BambooColor {
  BambooColor._();

  /// Slate
  static MaterialColor slate = const MaterialColor(
    _slateValue,
    <int, Color>{
      50: Color(0xfff8fafc),
      100: Color(0xfff1f5f9),
      200: Color(0xffe2e8f0),
      300: Color(0xffcbd5e1),
      400: Color(0xff94a3b8),
      500: Color(_slateValue),
      600: Color(0xff475569),
      700: Color(0xff334155),
      800: Color(0xff1e293b),
      900: Color(0xff0f172a),
    },
  );
  static const int _slateValue = 0xFF64748b;

  /// Grey Color
  static MaterialColor grey = const MaterialColor(
    _greyValue,
    <int, Color>{
      50: Color(0xFFf9fafb),
      100: Color(0xFFf3f4f6),
      200: Color(0xFFe5e7eb),
      300: Color(0xFFd1d5db),
      400: Color(0xFF9ca3af),
      500: Color(_greyValue),
      600: Color(0xFF4b5563),
      700: Color(0xFF374151),
      800: Color(0xFF1f2937),
      900: Color(0xFF111827),
    },
  );

  static const int _greyValue = 0xff6b7280;

// Zinc Color
  static MaterialColor zinc = const MaterialColor(
    _zincValue,
    <int, Color>{
      50: Color(0xFFfafafa),
      100: Color(0xFFf4f4f5),
      200: Color(0xFFe4e4e7),
      300: Color(0xFFd4d4d8),
      400: Color(0xFFa1a1aa),
      500: Color(_zincValue),
      600: Color(0xFF52525b),
      700: Color(0xFF3f3f46),
      800: Color(0xFF27272a),
      900: Color(0xFF18181b),
    },
  );
  static const int _zincValue = 0xff71717a;

  /// Neutral Color
  static MaterialColor neutral = const MaterialColor(
    _neutralValue,
    <int, Color>{
      50: Color(0xFFfafafa),
      100: Color(0xFFf5f5f5),
      200: Color(0xFFe5e5e5),
      300: Color(0xFFd4d4d4),
      400: Color(0xFFa3a3a3),
      500: Color(_neutralValue),
      600: Color(0xFF525252),
      700: Color(0xFF404040),
      800: Color(0xFF262626),
      900: Color(0xFF171717),
    },
  );
  static const int _neutralValue = 0xff737373;

  /// Stone Color
  static MaterialColor stone = const MaterialColor(
    _stoneValue,
    <int, Color>{
      50: Color(0xFFfafaf9),
      100: Color(0xFFf5f5f4),
      200: Color(0xFFe7e5e4),
      300: Color(0xFFd6d3d1),
      400: Color(0xFFa8a29e),
      500: Color(_stoneValue),
      600: Color(0xFF57534e),
      700: Color(0xFF44403c),
      800: Color(0xFF292524),
      900: Color(0xFF1c1917),
    },
  );
  static const int _stoneValue = 0xff78716c;

  /// Red Color
  static MaterialColor red = const MaterialColor(
    _redValue,
    <int, Color>{
      50: Color(0xFFfef2f2),
      100: Color(0xFFfee2e2),
      200: Color(0xFFfecaca),
      300: Color(0xFFfca5a5),
      400: Color(0xFFf87171),
      500: Color(_redValue),
      600: Color(0xFFdc2626),
      700: Color(0xFFb91c1c),
      800: Color(0xFF991b1b),
      900: Color(0xFF7f1d1d),
    },
  );
  static const int _redValue = 0xffef4444;

  /// Orange
  static MaterialColor orange = const MaterialColor(
    _orangeValue,
    <int, Color>{
      50: Color(0xFFfff7ed),
      100: Color(0xFFffedd5),
      200: Color(0xFFfed7aa),
      300: Color(0xFFfdba74),
      400: Color(0xFFfb923c),
      500: Color(_orangeValue),
      600: Color(0xFFea580c),
      700: Color(0xFFc2410c),
      800: Color(0xFF9a3412),
      900: Color(0xFF7c2d12),
    },
  );

  static const int _orangeValue = 0xfff97316;

  /// Amber Color
  static MaterialColor amber = const MaterialColor(
    _amberValue,
    <int, Color>{
      50: Color(0xFFfffbeb),
      100: Color(0xFFfef3c7),
      200: Color(0xFFfde68a),
      300: Color(0xFFfcd34d),
      400: Color(0xFFfbbf24),
      500: Color(_amberValue),
      600: Color(0xFFd97706),
      700: Color(0xFFb45309),
      800: Color(0xFF92400e),
      900: Color(0xFF78350f),
    },
  );
  static const int _amberValue = 0xfff59e0b;

  /// Yellow Color
  static MaterialColor yellow = const MaterialColor(
    _yellowValue,
    <int, Color>{
      50: Color(0xFFfefce8),
      100: Color(0xFFfef9c3),
      200: Color(0xFFfef08a),
      300: Color(0xFFfde047),
      400: Color(0xFFfacc15),
      500: Color(_yellowValue),
      600: Color(0xFFca8a04),
      700: Color(0xFFa16207),
      800: Color(0xFF854d0e),
      900: Color(0xFF713f12),
    },
  );
  static const int _yellowValue = 0xffeab308;

  /// Lime
  static MaterialColor lime = const MaterialColor(
    _limeValue,
    <int, Color>{
      50: Color(0xFFf7fee7),
      100: Color(0xFFecfccb),
      200: Color(0xFFd9f99d),
      300: Color(0xFFbef264),
      400: Color(0xFFa3e635),
      500: Color(_limeValue),
      600: Color(0xFF65a30d),
      700: Color(0xFF4d7c0f),
      800: Color(0xFF3f6212),
      900: Color(0xFF365314),
    },
  );

  static const int _limeValue = 0xff84cc16;

  /// Green Color
  static MaterialColor green = const MaterialColor(
    _greenValue,
    <int, Color>{
      50: Color(0xFFf0fdf4),
      100: Color(0xFFdcfce7),
      200: Color(0xFFbbf7d0),
      300: Color(0xFF86efac),
      400: Color(0xFF4ade80),
      500: Color(_greenValue),
      600: Color(0xFF16a34a),
      700: Color(0xFF15803d),
      800: Color(0xFF166534),
      900: Color(0xFF14532d),
    },
  );
  static const int _greenValue = 0xff22c55e;

  /// Emerald Color
  static MaterialColor emerald = const MaterialColor(
    _emeraldValue,
    <int, Color>{
      50: Color(0xFFecfdf5),
      100: Color(0xFFd1fae5),
      200: Color(0xFFa7f3d0),
      300: Color(0xFF6ee7b7),
      400: Color(0xFF34d399),
      500: Color(_emeraldValue),
      600: Color(0xFF059669),
      700: Color(0xFF047857),
      800: Color(0xFF065f46),
      900: Color(0xFF064e3b),
    },
  );
  static const int _emeraldValue = 0xff10b981;

  /// Teal Color
  static MaterialColor teal = const MaterialColor(
    _tealValue,
    <int, Color>{
      50: Color(0xFFf0fdfa),
      100: Color(0xFFccfbf1),
      200: Color(0xFF99f6e4),
      300: Color(0xFF5eead4),
      400: Color(0xFF2dd4bf),
      500: Color(_tealValue),
      600: Color(0xFF0d9488),
      700: Color(0xFF0f766e),
      800: Color(0xFF115e59),
      900: Color(0xFF134e4a),
    },
  );
  static const int _tealValue = 0xff14b8a6;

  /// Cyan Color
  static MaterialColor cyan = const MaterialColor(
    _cyanValue,
    <int, Color>{
      50: Color(0xFFecfeff),
      100: Color(0xFFcffafe),
      200: Color(0xFFa5f3fc),
      300: Color(0xFF67e8f9),
      400: Color(0xFF22d3ee),
      500: Color(_cyanValue),
      600: Color(0xFF0891b2),
      700: Color(0xFF0e7490),
      800: Color(0xFF155e75),
      900: Color(0xFF164e63),
    },
  );
  static const int _cyanValue = 0xff06b6d4;

  /// Sky
  static MaterialColor sky = const MaterialColor(
    _skyValue,
    <int, Color>{
      50: Color(0xFFf0f9ff),
      100: Color(0xFFe0f2fe),
      200: Color(0xFFbae6fd),
      300: Color(0xFF7dd3fc),
      400: Color(0xFF38bdf8),
      500: Color(_skyValue),
      600: Color(0xFF0284c7),
      700: Color(0xFF0369a1),
      800: Color(0xFF075985),
      900: Color(0xFF0c4a6e),
    },
  );
  static const int _skyValue = 0xff0ea5e9;

  /// Blue Color
  static MaterialColor blue = const MaterialColor(
    _blueValue,
    <int, Color>{
      50: Color(0xFFeff6ff),
      100: Color(0xFFdbeafe),
      200: Color(0xFFbfdbfe),
      300: Color(0xFF93c5fd),
      400: Color(0xFF60a5fa),
      500: Color(_blueValue),
      600: Color(0xFF2563eb),
      700: Color(0xFF1d4ed8),
      800: Color(0xFF1e40af),
      900: Color(0xFF1e3a8a),
    },
  );
  static const int _blueValue = 0xff3b82f6;

  /// Indigo Color
  static MaterialColor indigo = const MaterialColor(
    _indigoValue,
    <int, Color>{
      50: Color(0xFFeef2ff),
      100: Color(0xFFe0e7ff),
      200: Color(0xFFc7d2fe),
      300: Color(0xFFa5b4fc),
      400: Color(0xFF818cf8),
      500: Color(_indigoValue),
      600: Color(0xFF4f46e5),
      700: Color(0xFF4338ca),
      800: Color(0xFF3730a3),
      900: Color(0xFF312e81),
    },
  );
  static const int _indigoValue = 0xff6366f1;

  /// Violet Color
  static MaterialColor violet = const MaterialColor(
    _violetValue,
    <int, Color>{
      50: Color(0xFFf5f3ff),
      100: Color(0xFFede9fe),
      200: Color(0xFFddd6fe),
      300: Color(0xFFc4b5fd),
      400: Color(0xFFa78bfa),
      500: Color(_violetValue),
      600: Color(0xFF7c3aed),
      700: Color(0xFF6d28d9),
      800: Color(0xFF5b21b6),
      900: Color(0xFF4c1d95),
    },
  );
  static const int _violetValue = 0xff8b5cf6;

  /// Purple Color
  static MaterialColor purple = const MaterialColor(
    _purpleValue,
    <int, Color>{
      50: Color(0xFFfaf5ff),
      100: Color(0xFFf3e8ff),
      200: Color(0xFFe9d5ff),
      300: Color(0xFFd8b4fe),
      400: Color(0xFFc084fc),
      500: Color(_purpleValue),
      600: Color(0xFF9333ea),
      700: Color(0xFF7e22ce),
      800: Color(0xFF6b21a8),
      900: Color(0xFF581c87),
    },
  );
  static const int _purpleValue = 0xffa855f7;

  ///Fuchsia Color
  static MaterialColor fuchsia = const MaterialColor(
    _fuchsiaValue,
    <int, Color>{
      50: Color(0xFFfdf4ff),
      100: Color(0xFFfae8ff),
      200: Color(0xFFf5d0fe),
      300: Color(0xFFf0abfc),
      400: Color(0xFFe879f9),
      500: Color(_fuchsiaValue),
      600: Color(0xFFc026d3),
      700: Color(0xFFa21caf),
      800: Color(0xFF86198f),
      900: Color(0xFF701a75),
    },
  );
  static const int _fuchsiaValue = 0xffd946ef;

  /// Pink Color
  static MaterialColor pink = const MaterialColor(
    _pinkValue,
    <int, Color>{
      50: Color(0xFFfdf2f8),
      100: Color(0xFFfce7f3),
      200: Color(0xFFfbcfe8),
      300: Color(0xFFf9a8d4),
      400: Color(0xFFf472b6),
      500: Color(_pinkValue),
      600: Color(0xFFdb2777),
      700: Color(0xFFbe185d),
      800: Color(0xFF9d174d),
      900: Color(0xFF831843),
    },
  );

  static const int _pinkValue = 0xffec4899;

  /// Rose Color
  static MaterialColor rose = const MaterialColor(
    _roseValue,
    <int, Color>{
      50: Color(0xFFfff1f2),
      100: Color(0xFFffe4e6),
      200: Color(0xFFfecdd3),
      300: Color(0xFFfda4af),
      400: Color(0xFFfb7185),
      500: Color(_roseValue),
      600: Color(0xFFe11d48),
      700: Color(0xFFbe123c),
      800: Color(0xFF9f1239),
      900: Color(0xFF881337),
    },
  );
  static const int _roseValue = 0xfff43f5e;
}
