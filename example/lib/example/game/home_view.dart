import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bamboo/bamboo.dart';
import 'package:example/example/template/styles.dart';
import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 7, 6, 6),
      body: Scrollbar(
        thickness: 5,
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: const [
              HeroCard(),
              Gallery(),
              Feature(),
              Requirements(),
              NewLetter(),
              Footer()
            ],
          ),
        ),
      ),
    );
  }
}

/// Fade in and Fade out overlay entry widget
class FadeOverlayEntry extends StatefulWidget {
  const FadeOverlayEntry({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
  });

  final Widget child;
  final Duration duration;
  final Curve curve;

  @override
  _FadeOverlayEntryState createState() => _FadeOverlayEntryState();
}

class _FadeOverlayEntryState extends State<FadeOverlayEntry>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  void _showOverlay(BuildContext context) async {
    OverlayState? overlayState = Overlay.of(context);
    late OverlayEntry overlay1;

    overlay1 = OverlayEntry(
      builder: (context) {
        return GestureDetector(
          onTap: () {
            _controller.reverse();
            Future.delayed(widget.duration, () {
              overlay1.remove();
            });
            // overlay1.remove();
          },
          child: FadeTransition(
            opacity: _animation,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  /// Caculate a third of the screen width
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black.withOpacity(0.5),
                  child: const MobileNavigationItems(),
                ),
              ),
            ),
          ),
        );
      },
    );

    overlayState?.insertAll([
      overlay1,
    ]);
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.curve,
      ),
    )
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showOverlay(context);
        _controller.forward();
      },
      child: widget.child,
    );
  }
}

class MobileNavigationItems extends StatelessWidget {
  const MobileNavigationItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {},
          child: const AutoSizeText(
            "HOME",
            style: TextStyles.header,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const AutoSizeText(
            "ABOUT",
            style: TextStyles.header,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const AutoSizeText(
            "ROADMAP",
            style: TextStyles.header,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const AutoSizeText(
            "COLLECTION",
            style: TextStyles.header,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const AutoSizeText(
            "FAQS",
            style: TextStyles.header,
          ),
        ),
      ],
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff080A0B),
      padding: const EdgeInsets.symmetric(
        vertical: 30,
      ),
      child: Column(
        children: [
          const BambooWidget(
            mobile: SizedBox.shrink(),
            desktop: FooterNavBar(),
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            height: 10,
            thickness: 1,
            color: Color.fromARGB(39, 156, 155, 155),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1,
              vertical: 10,
            ),
            child: Wrap(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              runSpacing: 20,

              children: const [
                AutoSizeText(
                  ' © 2018 Outpost Games, Inc. All Rights Reserved',
                  style: TextStyles.body,
                  textAlign: TextAlign.center,
                ),
                AutoSizeText(
                  'Privacy Policy | Terms of Services | Code of Conduct ',
                  style: TextStyles.body,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FooterNavBar extends StatelessWidget {
  const FooterNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          Assets.images.games.logoPng.path,
          height: 50,
        ),
        const NavigationItems(),
        Row(
          children: [
            SvgPicture.asset(
              Assets.images.games.xboxicon.path,
            ),
            const SizedBox(
              width: 20,
            ),
            SvgPicture.asset(
              Assets.images.games.steamicon.path,
            ),
          ],
        ),
      ],
    );
  }
}

class NewLetter extends StatelessWidget {
  const NewLetter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 750,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: const Color(0xff080A0B),
        image: DecorationImage(
          opacity: 0.5,
          image: AssetImage(
            Assets.images.games.toy.path,
          ),
        ),
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Assets.images.games.toy.image(
          //   height: Bamboo.number(
          //     context: context,
          //     mobile: 100,
          //     desktop: 600,
          //   ),
          // ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                'WANT TO STAY IN TOUCH?',
                style: TextStyles.header.copyWith(
                  fontSize: 15,
                  height: 1.5,
                  letterSpacing: 3,
                  wordSpacing: 1,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              AutoSizeText(
                'NEWSLETTER SUBSCRIBE',
                style: TextStyles.header.copyWith(
                  color: Colors.white,
                  fontSize: 50,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 400,
                child: AutoSizeText(
                  'In order to start receiving our news, all you have to do is enter your email address. Everything else will be taken care of by us. We will send you emails containing information about game. We don\'t spam..',
                  style: TextStyles.body.copyWith(
                    color: Colors.white.withOpacity(0.8),
                    wordSpacing: 1.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Wrap(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                runSpacing: 20,
                children: [
                  SizedBox(
                    width: Bamboo.number(
                      context: context,
                      mobile: double.infinity,
                      desktop: 300,
                    ),
                    // height: 200,
                    child: TextField(
                      cursorColor: Colors.white,
                      style: TextStyles.body.copyWith(
                        color: const Color(0xffFFB548),
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                        hintText: 'rexthedev@gmail.com',
                        hintStyle: TextStyles.body.copyWith(
                          color: const Color(0xffFFB548),
                          fontSize: 14,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        filled: true,
                        fillColor: const Color(0xff1C1E1F),
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   width: 10,
                  //   height: 10,
                  // ),
                  AnimatedButton(
                    height: 50,
                    width: Bamboo.number(
                      context: context,
                      mobile: double.infinity,
                      desktop: 150,
                    ),
                    borderColor: Colors.white,
                    color: const Color(0xffFFB548),
                    onPressed: () {},
                    child: const AutoSizeText(
                      'Subscribe now',
                      style: TextStyle(
                        height: 1.5,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff1A1917),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Requirements extends StatelessWidget {
  const Requirements({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 750,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            Assets.images.games.requirementPng.path,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            'CAN MY COMPUTER RUN THIS GAME?',
            style: TextStyles.header.copyWith(
              fontSize: 15,
              height: 1.5,
              letterSpacing: 3,
              wordSpacing: 1,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          AutoSizeText(
            'SYSTEM REQUIREMENTS',
            style: TextStyles.header.copyWith(
              color: Colors.white,
              fontSize: 50,
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(
              horizontal: Bamboo.number(
                context: context,
                mobile: 0,
                desktop: 50,
              ),
            ),
            child: SvgPicture.asset(
              Assets.images.games.requirements.path,
              // fit: BoxFit.scaleDown,
            ),
          )
        ],
      ),
    );
  }
}

class Feature extends StatelessWidget {
  const Feature({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: const Alignment(0.4, 0.0),
      height: 750,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            Assets.images.games.feat.path,
          ),
          opacity: 0.6,
          fit: BoxFit.cover,
        ),
      ),
      child: FittedBox(
        child: Container(
          alignment: Alignment.centerRight,
          child: FittedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText(
                  'WHAT\'S SO SPECIAL?',
                  style: TextStyles.header.copyWith(
                    fontSize: 15,
                    height: 1.5,
                    letterSpacing: 3,
                    wordSpacing: 1,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                AutoSizeText(
                  'FEATURES',
                  style: TextStyles.header.copyWith(
                    color: Colors.white,
                    fontSize: 50,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Row(
                  children: [
                    const GalleryDivider(),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          'SURVIVE AT ALL COSTS',
                          style: TextStyles.header.copyWith(
                            color: const Color(0xffFFB548),
                            fontSize: 25,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 300,
                          child: AutoSizeText(
                            'You have 30 minutes to find a relic, signal for extraction, and grab one of three spots on the rescue chopper.',
                            style: TextStyles.body.copyWith(
                              color: Colors.white.withOpacity(0.8),
                              wordSpacing: 1.0,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AutoSizeText(
                          'CREATE ALLIES AND ENEMIES',
                          style: TextStyles.header.copyWith(
                            color: const Color(0xffFFB548),
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    AutoSizeText(
                      'IMPRESS THE AUDIENCE',
                      style: TextStyles.header.copyWith(
                        color: const Color(0xffFFB548),
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GalleryDivider extends StatelessWidget {
  const GalleryDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 10,
          width: 10,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
        Container(
          height: 120,
          width: 2,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
            ),
          ),
        ),
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class Gallery extends StatelessWidget {
  const Gallery({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Bamboo.number(
        context: context,
        mobile: 900,
        desktop: 750,
      ),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Bamboo.value(
            context: context,
            mobile: Assets.images.games.gallerymobile.path,
            desktop: Assets.images.games.section2.path,
          )),
          fit: BoxFit.fill,
        ),
      ),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        runSpacing: 10,
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          SizedBox(
            width: 100,
            height: 20,
          ),
          StoryLabel(),
          SizedBox(
            width: 100,
            height: 20,
          ),
          ImageStack()
        ],
      ),
    );
  }
}

class ImageStack extends StatefulWidget {
  const ImageStack({super.key});

  @override
  State<ImageStack> createState() => _ImageStackState();
}

class _ImageStackState extends State<ImageStack> {
  bool shouldScale = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          shouldScale = true;
        });
      },
      onExit: (event) {
        setState(() {
          shouldScale = false;
        });
      },
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: shouldScale ? 0.5 : 1,
        child: Stack(
          fit: StackFit.loose,
          alignment: Alignment.center,
          children: [
            for (var i = 0; i < stories.length; i++) ...[
              Transform.translate(
                offset: Offset(i * -10, i.toDouble() * 9),
                child: Container(
                  height: 400,
                  width: 320,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        stories[i],
                      ),
                    ),
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

List<String> stories = [
  Assets.images.games.stack4.path,
  Assets.images.games.stack2.path,
  Assets.images.games.stack3.path,
  Assets.images.games.stack1.path,
];

/// Widget that has stack card and switch them when a button is click
class StoryLabel extends StatelessWidget {
  const StoryLabel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AutoSizeText(
          'WHAT IS SOS?',
          style: TextStyles.header.copyWith(
            fontSize: 15,
            height: 1.5,
            letterSpacing: 3,
            wordSpacing: 1,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        AutoSizeText(
          'SOCIAL BATTLE\nROYALE GAME',
          style: TextStyles.header.copyWith(
            color: Colors.white,
            fontSize: 50,
          ),
        ),
        SizedBox(
          height: 10.0,
          width: 500,
          child: Center(
            child: Container(
              margin: const EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
              height: 2,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          alignment: Alignment.centerRight,
          width: 500,
          child: UnconstrainedBox(
            child: LimitedBox(
              maxWidth: 350,
              child: AutoSizeText(
                "Each round, you and 15 other contestants compete to escape a deadly island filled with monsters. The trick is: three people can survive. Will you run solo or form friendships with others to escape?\n\nMaking the right decisions could be the difference between life and death.",
                style: TextStyles.body.copyWith(
                  color: Colors.white.withOpacity(0.8),
                  wordSpacing: 1.0,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class HeroCard extends StatelessWidget {
  const HeroCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 750,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            Bamboo.value(
              context: context,
              mobile: Assets.images.games.heromobile.path,
              desktop: Assets.images.games.heroPng.path,
            ),
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BambooWidget(
            mobile: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 80,
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    Assets.images.games.logoPng.path,
                    height: 50,
                  ),
                  FadeOverlayEntry(
              
                    child: SvgPicture.asset(
                      Assets.images.games.menu.path,
                    ),
                  )
                ],
              ),
            ),
            desktop: const Padding(
              padding: EdgeInsets.all(11.0),
              child: NavBar(),
            ),
          ),
          const HeroLabel(),
          Column(
            children: [
              Text(
                'THE STORY',
                style: TextStyles.body1.copyWith(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              IconButton(
                hoverColor: Colors.transparent,
                onPressed: () {},
                icon: SvgPicture.asset(
                  Assets.images.games.scrolldown.path,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  const NavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          Assets.images.games.logoPng.path,
          height: 50,
        ),
        const NavigationItems(),
        Row(
          children: [
            SvgPicture.asset(
              Assets.images.games.xboxicon.path,
            ),
            const SizedBox(
              width: 20,
            ),
            SvgPicture.asset(
              Assets.images.games.steamicon.path,
            ),
          ],
        ),
      ],
    );
  }
}

class HeroLabel extends StatelessWidget {
  const HeroLabel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AutoSizeText(
          'SURVIVE AT ALL COSTS',
          textAlign: TextAlign.center,
          style: TextStyles.header.copyWith(
            height: 1,
            fontSize: Bamboo.number(
              context: context,
              mobile: 60,
              desktop: 80,
            ),
          ),
        ),
        AutoSizeText(
          'EXPERIENCE NEW SOCIAL BATTLE ROYALE GAME',
          style: TextStyles.header.copyWith(
            fontSize: 15,
            height: 1.5,
            letterSpacing: 3,
            wordSpacing: 1,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        AnimatedButton(
          height: Bamboo.number(
            context: context,
            mobile: 60,
            desktop: 45,
          ),
          width: 250,
          borderColor: Colors.white,
          color: const Color(0xffFFB548),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AutoSizeText(
                'Buy Now on Steam',
                style: TextStyle(
                  height: 1.5,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff1A1917),
                ),
                textAlign: TextAlign.center,
              ),
              const VerticalDivider(
                indent: 10,
                endIndent: 10,
                thickness: 0.5,
                color: Color(0xff1A1917),
              ),
              AutoSizeText(
                '\$14.99m',
                style: TextStyles.body1.copyWith(
                  height: 1.5,
                  wordSpacing: 1,
                  color: const Color(0xff1A1917),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class NavigationItems extends StatelessWidget {
  const NavigationItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        HoverButton(
          width: 30,
          child: AutoSizeText(
            "MAIN",
            style: TextStyles.body.copyWith(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        HoverButton(
          child: AutoSizeText(
            "ABOUT",
            style: TextStyles.body.copyWith(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        HoverButton(
          child: AutoSizeText(
            "GAME FEATURES",
            style: TextStyles.body.copyWith(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        HoverButton(
          child: AutoSizeText(
            "COLLECTION",
            style: TextStyles.body.copyWith(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        HoverButton(
          width: 50,
          child: AutoSizeText(
            "SYSTEM REQUIREMENTS",
            style: TextStyles.body.copyWith(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        HoverButton(
          child: AutoSizeText(
            "QUOTES",
            style: TextStyles.body.copyWith(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}

class HoverButton extends StatefulWidget {
  final Widget child;
  final double width;

  const HoverButton({
    super.key,
    required this.child,
    this.width = 40,
  });

  @override
  State<HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animation = Tween<double>(
      begin: 0,
      end: widget.width,
    ).animate(_controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        _controller.forward();
      },
      onExit: (event) {
        _controller.reverse();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Container(
                  margin: const EdgeInsets.only(
                    top: 5,
                  ),
                  width: _animation.value,
                  height: 30,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 3, color: Color(0xffFFB548)),
                    ),
                  ),
                );
              },
            ),
            widget.child,
          ],
        ),
      ),
    );
  }
}

class AnimatedButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Color color;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final double height;
  final double width;
  final Duration duration;

  const AnimatedButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.color = Colors.white,
    this.borderColor = Colors.white,
    this.borderWidth = 2,
    this.borderRadius = 10,
    this.height = 50,
    this.width = 200,
    this.duration = const Duration(milliseconds: 300),
  }) : super(key: key);

  @override
  createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = Tween<double>(
      begin: 0,
      end: widget.width,
    ).animate(
      _controller,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        _controller.forward();
      },
      onExit: (event) {
        _controller.reverse();
      },
      child: Container(
        height: widget.height,
        width: widget.width,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(
            5,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Container(
                    width: _animation.value,
                    decoration: BoxDecoration(
                      color: widget.borderColor,
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                    ),
                  );
                },
              ),
            ),
            Center(
              child: widget.child,
            ),
          ],
        ),
      ),
    );
  }
}
