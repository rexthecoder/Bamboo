import 'package:bamboo/bamboo.dart';
import 'package:bamboo/widgets/hidden.dart';
import 'package:example/example/template/colors.dart';
import 'package:example/example/template/expanded_icon.dart';
import 'package:example/example/template/helpers.dart';
import 'package:example/example/template/styles.dart';
import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class MinimalWebsite extends StatefulWidget {
  const MinimalWebsite({super.key});

  @override
  State<MinimalWebsite> createState() => _MinimalWebsiteState();
}

class _MinimalWebsiteState extends State<MinimalWebsite> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff10172A),
      body: SafeArea(
        child: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification is ScrollStartNotification) {
              Future.delayed(const Duration(microseconds: 200), (() {
                setState(() {
                  isExpanded = false;
                });
              }));
            }
            return true;
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Bamboo.number(
                context: context,
                mobile: 2,
                desktop: 24,
                tablet: 18,
                large: 24,
                unit: Unit.vmax,
              ),
              vertical: 16,
            ),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'MINIMAL',
                          style: TextStyles.header,
                        ),
                        BambooWidget(
                          mobile: ExapandedIcon(
                            isExpanded: isExpanded,
                            onPressed: (value) {
                              setState(() {
                                isExpanded = !isExpanded;
                              });
                            },
                          ),
                          desktop: Row(
                            children: menuItems
                                .map((e) => TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        foregroundColor:
                                            AppColors.secondaryVariant,
                                        textStyle: TextStyles.body1,
                                      ),
                                      child: Text(e),
                                    ))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                    BambooWidget(
                      mobile: MobileMenu(
                        isExpanded: isExpanded,
                      ),
                      tablet: MobileMenu(
                        isExpanded: isExpanded,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return PostCards(
                        index: index,
                        imagePath: images[index],
                      );
                    },
                  ),
                ),
              ],
              // children: [const PostCards()],
            ),
          ),
        ),
      ),
    );
  }
}

class PostCards extends StatelessWidget {
  const PostCards({
    Key? key,
    required this.imagePath,
    this.index = 0,
  }) : super(key: key);

  final String imagePath;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: Bamboo.number(
            context: context,
            mobile: 290,
            large: 300,
            desktop: 500,
          ),
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
          image: AssetImage(
            imagePath,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          "A BETTER BLOG FOR WRITING",
          style: TextStyles.subHeader,
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text",
          style: TextStyles.body,
        ),
        const SizedBox(
          height: 24,
        ),
        OutlinedButton(
          style: outlineButtonStyle,
          onPressed: () {},
          child: const Text('READ MORE'),
        ),
        const SizedBox(
          height: 24,
        ),
        if (index != 5)
          const Divider(
            thickness: 2,
            color: AppColors.secondaryVariant,
          ),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }
}

class MobileMenu extends StatelessWidget {
  const MobileMenu({
    Key? key,
    required this.isExpanded,
  }) : super(key: key);

  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: Container(height: 0.0),
      secondChild: Column(
        children: menuItems
            .map(
              (e) => Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: Text(
                  e,
                  style: TextStyles.headline1,
                ),
              ),
            )
            .toList(),
      ),
      firstCurve: const Interval(
        0.0,
        0.6,
        curve: Curves.fastOutSlowIn,
      ),
      secondCurve: const Interval(
        0.4,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
      sizeCurve: Curves.fastOutSlowIn,
      crossFadeState:
          isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: kThemeAnimationDuration,
    );
  }
}
