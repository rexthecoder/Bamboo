import 'package:bamboo/bamboo.dart';
import 'package:flutter/material.dart';


/// BambooMode lets you style your
/// app differently when dark or light mode is enabled
/// To make this as easy as possible,
class BambooMode extends StatelessWidget {
  const BambooMode({
    super.key,
    required this.dark,
    required this.light,
  });

  final Widget light;
  final Widget dark;

  @override
  Widget build(BuildContext context) {
    return Mode(
      context: context,
      light: light,
      dark: dark,
    ).value;
  }
}
