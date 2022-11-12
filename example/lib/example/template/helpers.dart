import 'package:example/example/template/styles.dart';
import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';

List<String> menuItems = [
  'HOME',
  'PORTFOLIO',
  'STYLE',
  'ABOUT',
  'CONTACT',
];

final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
  foregroundColor: const Color(0xffE2E8F0),
  minimumSize: const Size(100, 50),
  side: const BorderSide(
    color: Color(0xffE2E8F0),
    width: 1,
  ),
  textStyle: TextStyles.body.copyWith(
    fontWeight: FontWeight.bold,
    color: const Color(0xffE2E8F0),
  ),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(5),
    ),
  ),
).copyWith(
  foregroundColor: MaterialStateProperty.all<Color>(const Color(0xffE2E8F0)),
  overlayColor: MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.hovered)) {
        return Colors.blue.withOpacity(0.04);
      }
      if (states.contains(MaterialState.focused) ||
          states.contains(MaterialState.pressed)) {
        return Colors.blue.withOpacity(0.12);
      }
      return null; // Defer to the widget's default.
    },
  ),
);

List<String> images = [
  Assets.images.paperFlowerOverheadBwW1080.path,
  Assets.images.coffeePaperclipsPencilAngledBwW1080.path,
  Assets.images.iphoneCactusTeaOverheadBwW1080.path,
  Assets.images.joyNoteCoffeeEyeglassesOverheadBwW1080.path,
  Assets.images.mugsSideBwW1080.path,
  Assets.images.typewriterOverheadBwW1080.path,
];
