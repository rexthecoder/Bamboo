import 'package:auto_size_text/auto_size_text.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeroCard(),
            Container(
              height: 750,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    Assets.images.games.section2.path,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [StoryLabel(), StackCard()],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StackCard extends StatefulWidget {
  const StackCard({
    Key? key,
  }) : super(key: key);

  @override
  State<StackCard> createState() => _StackCardState();
}

class _StackCardState extends State<StackCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2,
      ),
    );

    CurvedAnimation curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _animation = Tween<Offset>(
      begin: const Offset(0.0, 0.0),
      end: const Offset(-5.0, 0.0),
    ).animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 300,
      child: PageView(
        
        children: [
          Container(
            height: 400,
            width: 320,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  Assets.images.games.stack3.path,
                ),
              ),
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
          ),
          Container(
            height: 400,
            width: 320,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  Assets.images.games.stack1.path,
                ),
              ),
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Widget that has stack card and switch them when a button is click

class StoryLabel extends StatelessWidget {
  const StoryLabel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          'WHAT IS SOS?',
          style: TextStyles.body.copyWith(
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
          ),
        ),
        const Divider(
          color: Colors.white,
        ),
        SizedBox(
          width: 400,
          child: AutoSizeText(
            "Each round, you and 15 other contestants compete to escape a deadly island filled with monsters. The trick is: three people can survive. Will you run solo or form friendships with others to escape?\n\nMaking the right decisions could be the difference between life and death.",
            style: TextStyles.body.copyWith(
              color: Colors.white,
              fontSize: 12,
            ),
            textAlign: TextAlign.start,
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
            Assets.images.games.heroPng.path,
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(11.0),
            child: NavBar(),
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
            fontSize: 80,
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
          height: 45,
          borderColor: Colors.white,
          color: const Color(0xffFFB548),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AutoSizeText(
                'Buy Now on Steam',
                style: TextStyle(
                  fontSize: 10,
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
                  fontSize: 12,
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
