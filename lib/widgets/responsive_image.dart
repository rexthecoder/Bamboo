/// Image widget which works like css Picture element
import 'package:flutter/material.dart';

enum ImageType {
  /// Image as network
  network,

  /// Image as asset
  asset,
}

class BambooImage extends StatelessWidget {
  const BambooImage({
    super.key,
    required this.child,
    required this.mobile,
    this.desktop,
    this.large,
    this.tablet,
  });

  /// Give the child of image type of network
  /// or asset
  final NetworkImage child;
  final String mobile;
  final String? tablet;
  final String? desktop;
  final String? large;

  @override
  Widget build(BuildContext context) {
    /// Update the name string when the Image Type is asset 
    /// and update the url when the Image Type is network
    String name = mobile;
    String url = mobile;
    if (tablet != null) {
      name = tablet!;
      url = tablet!;
    }
    if (desktop != null) {
      name = desktop!;
      url = desktop!;
    }
    if (large != null) {
      name = large!;
      url = large!;
    }
    return Image(
      image: child,
      key: ValueKey(name),
      fit: BoxFit.cover,
      
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          url,
          key: ValueKey(name),
          fit: BoxFit.cover,
        );
      },
    );

  }
}
