import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

enum AnimationType {
  fadeIn,
  fadeInDown,
  findInRight,
  findInLeft,
}

class ScrollToReveal extends StatefulWidget {
  const ScrollToReveal({
    Key? key,
    required this.child,
    required this.label,
    required this.scrollController,
    this.incrementPosition = 400,
    this.animationType = AnimationType.findInLeft,
  }) : super(key: key);

  final Widget child;
  final String label;
  final ScrollController scrollController;
  final int incrementPosition;
  final AnimationType animationType;

  @override
  State<ScrollToReveal> createState() => _ScrollToRevealState();
}

class _ScrollToRevealState extends State<ScrollToReveal> {
  late GlobalObjectKey _key;
  late AnimationController animateController;
  // Coordinates
  double _y = 0;
  bool show = false;

  @override
  void initState() {
    _key = GlobalObjectKey(widget.label);
    widget.scrollController.addListener(() {
      final renderBox = _key.currentContext?.findRenderObject() as RenderBox;
      final Offset offset = renderBox.localToGlobal(
        Offset.zero,
      );
      _y = offset.dy;

      // if scroll controller reache the _y, it should play the animation once
      if (widget.scrollController.offset >= _y + widget.incrementPosition) {
        if (!show) {
          animateController.forward();
          show = true;
        }
      } else {
        if (show) {
          animateController.reverse();
          show = false;
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.animationType) {
      case AnimationType.fadeIn:
        return FadeIn(
          manualTrigger: true,
          delay: const Duration(seconds: 60),
          controller: (controller) => animateController = controller,
          duration: const Duration(milliseconds: 500),
          key: _key,
          child: widget.child,
        );
      case AnimationType.fadeInDown:
        return FadeInDown(
          manualTrigger: true,
          delay: const Duration(seconds: 60),
          controller: (controller) => animateController = controller,
          duration: const Duration(milliseconds: 500),
          key: _key,
          child: widget.child,
        );
      case AnimationType.findInRight:
        return FadeInRight(
          manualTrigger: true,
          delay: const Duration(seconds: 60),
          controller: (controller) => animateController = controller,
          duration: const Duration(milliseconds: 500),
          key: _key,
          child: widget.child,
        );
      case AnimationType.findInLeft:
        return FadeInLeft(
          manualTrigger: true,
          delay: const Duration(seconds: 60),
          controller: (controller) => animateController = controller,
          duration: const Duration(milliseconds: 500),
          key: _key,
          child: widget.child,
        );

      default:
        return ElasticIn(
          manualTrigger: true,
          delay: const Duration(seconds: 60),
          controller: (controller) => animateController = controller,
          duration: const Duration(milliseconds: 500),
          key: _key,
          child: widget.child,
        );
    }
  }
}
