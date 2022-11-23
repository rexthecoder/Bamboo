import 'package:auto_size_text/auto_size_text.dart';
import 'package:bamboo/bamboo.dart';
import 'package:example/example/template/styles.dart';
import 'package:example/example/zeus/theme/zeus_colors.dart';
import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const NavigationBar(),
          AutoSizeText(
            'ZEUS UI',
            style: TextStyles.headline1,
          ),
          AutoSizeText(
            'Create & sell your NFTs today',
            style: TextStyles.header.copyWith(
              fontSize: 80,
              color: Colors.black,
            ),
          ),
          AutoSizeText(
            'Create & sell your NFTs today',
          ),
          AutoSizeText(
            'Velit, odio bibendum eu, viverra sit laoreet posuere. Ut scelerisque posuere massa amet. Ornare lacinia vitae at vestibulum morbi. Volutpat libero curabitur feugiat risus dui pulvinar. Elementum.',
            style: TextStyles.body,
          )
        ],
      ),
    );
  }
}

class NavigationBar extends StatelessWidget {
  const NavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Bamboo.number(
          context: context,
          mobile: 2,
          desktop: 2,
          unit: Unit.vmax,
        ),
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: ZeusColors.secondary,
            width: 2,
          ),
        ),
      ),
      height: Bamboo.number(
        context: context,
        mobile: 70,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              TextButton(
                onPressed: () {},
                child: const AutoSizeText(
                  "Hello",
                  style: TextStyles.body,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              TextButton(
                onPressed: () {},
                child: const AutoSizeText(
                  "University",
                  style: TextStyles.body,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              TextButton(
                onPressed: () {},
                child: const AutoSizeText(
                  "Course",
                  style: TextStyles.body,
                ),
              )
            ],
          ),
          Image(
            height: 30,
            image: AssetImage(
              Assets.images.zeus.path,
            ),
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {},
                child: const AutoSizeText(
                  "Use Case",
                  style: TextStyles.body,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              TextButton(
                onPressed: () {},
                child: const AutoSizeText(
                  "Plans",
                  style: TextStyles.body,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              TextButton(
                onPressed: () {},
                child: const AutoSizeText(
                  "Resources",
                  style: TextStyles.body,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
