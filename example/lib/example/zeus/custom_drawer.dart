import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    required this.onPressed,
    required this.child,
    super.key,
    this.isExpanded = false,
    this.size = 24.0,
    this.padding = const EdgeInsets.all(8.0),
    this.color,
    this.disabledColor,
    this.expandedColor,
  });
  final bool isExpanded;
  final double size;
  final ValueChanged<bool>? onPressed;
  final EdgeInsetsGeometry padding;
  final Color? color;
  final Color? disabledColor;
  final Color? expandedColor;

  final Widget child;

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer>
    with TickerProviderStateMixin {
  late OverlayEntry overlayEntry;
  late AnimationController _drawerSlideController;
  late AnimationController _controller;

  void showOverlay(BuildContext context) {
    OverlayState? overlayState = Overlay.of(context);

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 0,
        left: 0,
        child: AnimatedBuilder(
          animation: _drawerSlideController,
          builder: (context, child) {
            return FractionalTranslation(
              // transalation that slide from left to right
              translation: Offset(
                -1.0 + _drawerSlideController.value,
                0.0,
              ),

              child: child,
            );
          },
          child: GestureDetector(
            onTap: () {},
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  /// Caculate a third of the screen width
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black.withOpacity(0.5),
                  child: widget.child,
                ),
              ),
            ),
          ),
        ),
      ),
    );

    overlayState!.insert(overlayEntry);
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: kThemeAnimationDuration,
      vsync: this,
    );
    _drawerSlideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    // If the widget is initially expanded, rotate the icon without animating it.
    if (widget.isExpanded) {
      _controller.value = math.pi;
    }
  }

  @override
  void dispose() {
    _drawerSlideController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(CustomDrawer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isExpanded != oldWidget.isExpanded) {
      if (widget.isExpanded) {
        _controller.forward();
        _drawerSlideController.forward();
        // showOverlay(context);
      } else {
        _drawerSlideController.reverse(from: 0);
        _controller.reverse();
      }
    }
  }

  void _handlePressed() {
    if (widget.isExpanded) {
      overlayEntry.remove();
    } else {
      showOverlay(context);
    }

    widget.onPressed?.call(widget.isExpanded);
  }

  Color get _iconColor {
    if (widget.isExpanded && widget.expandedColor != null) {
      return widget.expandedColor!;
    }

    if (widget.color != null) {
      return widget.color!;
    }

    switch (Theme.of(context).brightness) {
      case Brightness.light:
        return const Color(0xffE2E8F0);
      case Brightness.dark:
        return const Color(0xffE2E8F0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);
    final String onTapHint = widget.isExpanded
        ? localizations.expandedIconTapHint
        : localizations.collapsedIconTapHint;
    return Semantics(
      onTapHint: widget.onPressed == null ? null : onTapHint,
      child: IconButton(
        padding: widget.padding,
        iconSize: widget.size,
        color: _iconColor,
        disabledColor: widget.disabledColor,
        onPressed: widget.onPressed == null ? null : _handlePressed,
        icon: AnimatedIcon(
          color: _iconColor,
          icon: AnimatedIcons.menu_close,
          progress: _controller,
        ),
      ),
    );
  }
}
