/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/background.png
  AssetGenImage get background =>
      const AssetGenImage('assets/images/background.png');

  /// File path: assets/images/coffee_paperclips_pencil_angled_bw_w1080.jpg
  AssetGenImage get coffeePaperclipsPencilAngledBwW1080 => const AssetGenImage(
      'assets/images/coffee_paperclips_pencil_angled_bw_w1080.jpg');

  /// File path: assets/images/iphone_cactus_tea_overhead_bw_w1080.jpg
  AssetGenImage get iphoneCactusTeaOverheadBwW1080 => const AssetGenImage(
      'assets/images/iphone_cactus_tea_overhead_bw_w1080.jpg');

  /// File path: assets/images/joy_note_coffee_eyeglasses_overhead_bw_w1080.jpg
  AssetGenImage get joyNoteCoffeeEyeglassesOverheadBwW1080 =>
      const AssetGenImage(
          'assets/images/joy_note_coffee_eyeglasses_overhead_bw_w1080.jpg');

  /// File path: assets/images/mugs_side_bw_w1080.jpg
  AssetGenImage get mugsSideBwW1080 =>
      const AssetGenImage('assets/images/mugs_side_bw_w1080.jpg');

  /// File path: assets/images/paper_flower_overhead_bw_w1080.jpg
  AssetGenImage get paperFlowerOverheadBwW1080 =>
      const AssetGenImage('assets/images/paper_flower_overhead_bw_w1080.jpg');

  /// File path: assets/images/typewriter_overhead_bw_w1080.jpg
  AssetGenImage get typewriterOverheadBwW1080 =>
      const AssetGenImage('assets/images/typewriter_overhead_bw_w1080.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [
        background,
        coffeePaperclipsPencilAngledBwW1080,
        iphoneCactusTeaOverheadBwW1080,
        joyNoteCoffeeEyeglassesOverheadBwW1080,
        mugsSideBwW1080,
        paperFlowerOverheadBwW1080,
        typewriterOverheadBwW1080
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
