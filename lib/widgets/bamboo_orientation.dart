import 'package:bamboo/foundation/foundation.dart';
import 'package:flutter/material.dart';


/// Flutter update oreitaion based on the screen size
/// so use orientaion when you want to make discission on how you layout on things.
/// Landscape oreintation will be bigger than portrait
class BambooOrientation extends StatelessWidget {
  const BambooOrientation({
    super.key,
    required this.portrait,
    required this.landscape,
  });

  final Widget portrait;
  final Widget landscape;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (context.isPortrait) {
          return portrait;
        } else if (context.isLandscape) {
          return landscape;
        } else {
          throw FlutterError('Orientation value not found');
        }
      },
    );
  }
}
