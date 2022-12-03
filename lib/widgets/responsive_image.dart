/// Image widget which works like css Picture element
import 'package:bamboo/services/responsive.dart';
import 'package:flutter/material.dart';

typedef ResponsiveImageBuilder = Widget Function(
  BuildContext context,
  dynamic imagePath,
);

class BambooImage extends StatelessWidget {
  const BambooImage({
    super.key,
    required this.builder,
    required this.mobile,
    this.desktop,
    this.large,
    this.tablet,
  });

  /// Give the child of image type of network
  final ResponsiveImageBuilder builder;
  final String mobile;
  final String? tablet;
  final String? desktop;
  final String? large;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return builder(
          context,
          Bamboo.value(
            context: context,
            mobile: mobile,
            tablet: tablet,
            desktop: desktop,
            large: large,
          ),
        );
      },
    );
  }
}
