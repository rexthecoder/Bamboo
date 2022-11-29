import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum AniProps { opacity, translateY }

class FadeAnimation extends StatelessWidget {
  const FadeAnimation({
    required this.delay,
    required this.child,
    super.key,
  });
  final double delay;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<AniProps>()
      ..add(
        AniProps.opacity,
        Tween(begin: 0.0, end: 1.0),
        const Duration(milliseconds: 500),
      )
      ..add(
        AniProps.translateY,
        Tween(begin: -30.0, end: 0.0),
        const Duration(milliseconds: 500),
        Curves.easeOut,
      );

    return PlayAnimation<MultiTweenValues<AniProps>>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, value) => Opacity(
        opacity: value.get(AniProps.opacity),
        child: Transform.translate(
          offset: Offset(0, value.get(AniProps.translateY)),
          child: child,
        ),
      ),
    );
  }
}

class FadeAnimationWithCustomTween extends StatelessWidget {
  const FadeAnimationWithCustomTween({
    required this.delay,
    required this.child,
    required this.tween,
    required this.control,
    super.key,
  });
  final double delay;
  final Widget child;
  final MultiTween<AniProps> tween;
  final CustomAnimationControl control;

  @override
  Widget build(BuildContext context) {
    return CustomAnimation<MultiTweenValues<AniProps>>(
      control: control,
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, value) => Opacity(
        opacity: value.get(AniProps.opacity),
        child: Transform.translate(
          offset: Offset(0, value.get(AniProps.translateY)),
          child: child,
        ),
      ),
    );
  }
}