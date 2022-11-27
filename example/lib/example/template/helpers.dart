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

final ButtonStyle zeusOutlineButtonStyle = OutlinedButton.styleFrom(
  minimumSize: const Size(145, 50),
  backgroundColor: const Color(0xff141B22),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    side: BorderSide(
      color: Colors.black,
      width: 1,
    ),
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);

final ButtonStyle flatButtonStyle = TextButton.styleFrom(
  minimumSize: const Size(100, 48),
  backgroundColor: const Color(0xff141B22),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);

class Steps {
  Steps({
    required this.title,
    required this.description,
    required this.image,
  });

  final String title;
  final String description;
  final AssetGenImage image;
}

List<Steps> stepItems = [
  Steps(
    title: 'Step 1',
    description: 'Connect Your Wallet',
    image: Assets.images.step1,
  ),
  Steps(
    title: 'Step 2',
    description: 'Select Your Quaility',
    image: Assets.images.step2,
  ),
  Steps(
    title: 'Step 3',
    description: 'Confirm the Transaction',
    image: Assets.images.step3,
  ),
  Steps(
    title: 'Step 4',
    description: 'Receive Your NFTs',
    image: Assets.images.step4,
  ),
];
