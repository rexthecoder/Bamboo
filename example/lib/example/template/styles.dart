import 'package:example/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

/// Global text style with specific class
class TextStyles {
  static const TextStyle headline1 = TextStyle(
    fontSize: 20,
    fontFamily: FontFamily.alliance,
    fontWeight: FontWeight.w300,
    letterSpacing: 3,
    color: Color(0xffE2E8F0),
  );

  static const TextStyle header = TextStyle(
    fontSize: 35,
    fontFamily: FontFamily.blimone,
    fontWeight: FontWeight.bold,
    color: Color(0xffE2E8F0),
  );

  static const TextStyle subHeader = TextStyle(
    fontSize: 25,
    fontFamily: FontFamily.deja,
    fontWeight: FontWeight.normal,
    color: Color(0xffcbd5e1),
  );

  static const TextStyle body = TextStyle(
    fontSize: 15,
    fontFamily: FontFamily.alliance,
    fontWeight: FontWeight.w500,
    wordSpacing: 5,
    color: Color(0xff94A3B8),
  );

  static const TextStyle body1 = TextStyle(
    fontSize: 16,
    fontFamily: FontFamily.deja,
    fontWeight: FontWeight.w500,
    wordSpacing: 5,
    color: Color(0xff94A3B8),
  );
}
