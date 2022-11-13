import 'package:flutter/material.dart';

class AutoScaling extends StatelessWidget {
  final double baseWidth;
  final Widget child;

  AutoScaling({required this.baseWidth, required this.child});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Builder(
      builder: (context) {
        return AutoScalingSize.baseWidth(
          context: context,
          baseWidth: baseWidth,
          child: child,
        );
      },
    );
  }
}

class AutoScalingSize extends InheritedWidget {
  final double scaleFactor;

  static double? _staticScaleFactor;

  const AutoScalingSize({required this.scaleFactor, required Widget child})
      : super(child: child);

  factory AutoScalingSize.baseWidth(
      {required BuildContext context,
      required double baseWidth,
      required Widget child}) {
    _staticScaleFactor = baseWidth /
        MediaQuery.of(context).size.width *
        MediaQuery.of(context).devicePixelRatio;
    return AutoScalingSize(
      scaleFactor: _staticScaleFactor!,
      child: child,
    );
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return (oldWidget as AutoScalingSize).scaleFactor != scaleFactor;
  }

  static double scaleSize(BuildContext context, double orignSize) {
    AutoScalingSize autoScaleSize =
        context.dependOnInheritedWidgetOfExactType<AutoScalingSize>()!;
    if (autoScaleSize == null) {
      return orignSize * _staticScaleFactor!;
    } else {
      return orignSize * autoScaleSize.scaleFactor;
    }
  }
}
