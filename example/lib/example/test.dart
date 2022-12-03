import 'package:bamboo/bamboo.dart';
import 'package:bamboo/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Bamboo.value(
              context: context,
              mobile: const FlutterLogo(),
              tablet: const Text("data"),
            ),
          ),
          const BambooOrientation(
            portrait: Text(''),
            landscape: FlutterLogo(),
          ),
          BambooImage(
            builder: (BuildContext context, imagePath) {
              return Image.asset(imagePath);
            },
            mobile: 'assets/images/logo2x.png',
            tablet: 'assets/images/logo3x.png',
            desktop: 'assets/images/logo4x.png',
          ),
          const BambooHidden(
            desktop: true,
            tablet: false,
            mobile: false,
            large: false,
            child: Text(''),
          ),
          BambooWidget(
            mobile: Container(),
            tablet: const Text(''),
            desktop: const FlutterLogo(),
          ),
        ],
      ),
    );
  }
}
