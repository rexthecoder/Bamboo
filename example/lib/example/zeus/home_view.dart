import 'package:auto_size_text/auto_size_text.dart';
import 'package:bamboo/bamboo.dart';
import 'package:example/example/template/helpers.dart';
import 'package:example/example/template/styles.dart';
import 'package:example/example/zeus/custom_drawer.dart';
import 'package:example/example/zeus/scroll_to_reveal.dart';
import 'package:example/example/zeus/test_layout.dart';
import 'package:example/example/zeus/theme/zeus_colors.dart';
import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: ZeusColors.backgroundColor,
      body: SafeArea(
        child: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            return true;
          },
          child: SingleChildScrollView(
            controller: _controller,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ResponsiveNavigationBar(),
                const Hero(),
                const SizedBox(
                  height: 150,
                ),
                ScrollToReveal(
                  animationType: AnimationType.findInLeft,
                  incrementPosition: 0,
                  scrollController: _controller,
                  label: 'How',
                  child: const HowTo(),
                ),
                const SizedBox(
                  height: 60,
                ),
                ScrollToReveal(
                  animationType: AnimationType.findInRight,
                  scrollController: _controller,
                  label: 'Collection',
                  child: const HotCollection(),
                ),
                const SizedBox(
                  height: 60,
                ),
                ScrollToReveal(
                  animationType: AnimationType.findInLeft,
                  scrollController: _controller,
                  label: 'Story',
                  child: const StoryCollection(),
                ),
                const SizedBox(
                  height: 60,
                ),
                Center(
                  child: AutoSizeText.rich(
                    TextSpan(
                      text: 'BINABOX',
                      style: TextStyles.header.copyWith(
                        color: ZeusColors.primary,
                      ),
                      children: const [
                        TextSpan(
                          text: ' PARTNER',
                          style: TextStyles.header,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Assets.images.partnerPng.image(
                  width: MediaQuery.of(context).size.width - 300,
                ),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ResponsiveNavigationBar extends StatefulWidget {
  const ResponsiveNavigationBar({super.key});

  @override
  State<ResponsiveNavigationBar> createState() =>
      _ResponsiveNavigationBarState();
}

class _ResponsiveNavigationBarState extends State<ResponsiveNavigationBar> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: const Color(0xff040B11),
      child: Row(
        mainAxisAlignment: Bamboo.value(
          context: context,
          mobile: MainAxisAlignment.spaceBetween,
          large: MainAxisAlignment.spaceEvenly,
          desktop: MainAxisAlignment.spaceEvenly,
        ),
        children: [
          Image.asset(
            Assets.images.nftlogo.path,
            height: 30,
          ),
          BambooWidget(
            mobile: CustomDrawer(
              color: ZeusColors.primary,
              isExpanded: isExpanded,
              size: 35,
              onPressed: (value) {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: const MobileNavigationItems(),
            ),
            desktop: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                NavigationItems(),
                SizedBox(
                  width: 100,
                ),
                NavigationButtons(),
              ],
            ),
            large: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                NavigationItems(),
                SizedBox(
                  width: 100,
                ),
                NavigationButtons(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StoryCollection extends StatelessWidget {
  const StoryCollection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 400,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            Assets.images.story.path,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const TheStory(),
          SizedBox(
            width: 500,
            child: GridView.builder(
              itemCount: 4,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                mainAxisExtent: 180,
              ),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return const StoryCard();
              },
            ),
          )
        ],
      ),
    );
  }
}

class StoryCard extends StatelessWidget {
  const StoryCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: const Color(0xff141B22),
      ),
      constraints: const BoxConstraints(
        minHeight: 180,
        maxWidth: 250,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 45.0),
            child: AutoSizeText(
              '01',
              style: TextStyles.header.copyWith(
                color: const Color(0xff21E786).withOpacity(0.3),
                fontSize: 60,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AutoSizeText(
                  "Daily Tokens",
                  style: TextStyles.body.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AutoSizeText(
                    "Earn interstellar tokens passively by staking your collectible NFT.",
                    textAlign: TextAlign.center,
                    style: TextStyles.body.copyWith(
                      fontSize: 15,
                      color: const Color(0XFFC2C3C5),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TheStory extends StatelessWidget {
  const TheStory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            'THE STORY',
            style: TextStyles.header.copyWith(
              color: Colors.white,
            ),
          ),
          AutoSizeText(
            "Our collection's priority is to reward NFT holders by developing utilities they can use in their current everyday life. Not in a hypothetical future.",
            style: TextStyles.body.copyWith(
              fontSize: 15,
              color: const Color(0XFFC2C3C5),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: const [
              StoryCounter(
                title: 'Total Iteam',
                description: '2240+',
              ),
              SizedBox(
                width: 60,
              ),
              StoryCounter(
                title: 'Profiles whitelisted',
                description: '1000+',
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            style: zeusOutlineButtonStyle.copyWith(
              side: MaterialStateProperty.all(
                const BorderSide(
                  color: ZeusColors.primary,
                  width: 2,
                ),
              ),
              backgroundColor: MaterialStateProperty.all(
                Colors.transparent,
              ),
              maximumSize: MaterialStateProperty.all(
                const Size(180, 50),
              ),
            ),
            onPressed: () {},
            child: AutoSizeText(
              "READ MORE",
              style: TextStyles.body.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StoryCounter extends StatelessWidget {
  const StoryCounter({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AutoSizeText(
          title,
          style: TextStyles.body.copyWith(
            fontSize: 15,
            color: const Color(0xffC2C3C5),
          ),
        ),
        AutoSizeText(
          description,
          style: TextStyles.header.copyWith(
            color: Colors.white,
            fontSize: 35,
            shadows: [
              const Shadow(
                  color: Colors.white, blurRadius: 8, offset: Offset(0, 0))
            ],
          ),
        ),
      ],
    );
  }
}

class HotCollection extends StatelessWidget {
  const HotCollection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 205.0),
          child: AutoSizeText(
            'HOT COLLECTION',
            style: TextStyles.header.copyWith(
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 60,
        ),
        Center(
          child: SizedBox(
            child: Layout(
              crossAxisCount: Bamboo.value(
                context: context,
                mobile: 1,
                tablet: 2,
                desktop: 3,
                large: 4,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CollectionCard extends StatelessWidget {
  const CollectionCard({
    Key? key,
    required this.card,
  }) : super(key: key);

  final AssetGenImage card;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: const Color(0xff141B22),
      ),
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.symmetric(vertical: 18),
      constraints: const BoxConstraints(
        minHeight: 250,
        minWidth: 250,
      ),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          card.image(
            width: 220,
          ),
          const SizedBox(
            height: 10,
          ),
          AutoSizeText(
            'SKISIRS #02',
            style: TextStyles.body1.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class HowTo extends StatelessWidget {
  const HowTo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: AutoSizeText.rich(
            TextSpan(
              text: 'HOW TO',
              children: [
                TextSpan(
                  text: ' NFTALIEN',
                  style: TextStyles.header.copyWith(
                    color: ZeusColors.primary,
                  ),
                ),
                const TextSpan(
                  text: ' WORK',
                ),
              ],
            ),
            style: TextStyles.header,
          ),
        ),
        const SizedBox(
          height: 60,
        ),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: StepsCard(
                  title: stepItems[index].title,
                  subtitle: stepItems[index].description,
                  step: stepItems[index].image,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class StepsCard extends StatelessWidget {
  const StepsCard({
    Key? key,
    required this.step,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final AssetGenImage step;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: const Color(0xff141B22),
      ),
      constraints: const BoxConstraints(
        minHeight: 180,
        minWidth: 250,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          step.image(
            height: 80,
          ),
          const SizedBox(
            height: 5,
          ),
          AutoSizeText(
            title,
            style: TextStyles.body.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              height: 0.5,
              color: ZeusColors.primary,
            ),
          ),
          AutoSizeText(
            subtitle,
            style: TextStyles.body1.copyWith(
              fontSize: 15,
              height: 1.5,
              wordSpacing: 1,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

/// Container  with green shadow at the topLeft and bottomRight when hover
///  and green border when selected

class Hero extends StatelessWidget {
  const Hero({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: 600,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Assets.images.nft.image(
            height: 550,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AutoSizeText(
                'EXPLORE NFT COLLECTION',
                textAlign: TextAlign.center,
                style: TextStyles.header.copyWith(
                  //TODO: DEBUG THE HEIGHT ON OTHER SCREEB
                  height: 1,
                  fontSize: Bamboo.value(
                    context: context,
                    large: 70,
                    desktop: 70,
                    mobile: 60,
                  ),
                ),
              ),
              //TODO: DEBUG THE HEIGHT ON OTHER SCREEB
              SizedBox(
                height: 10,
              ),
              AutoSizeText(
                'A collection of 2525 highly-fashionable NFTs on the ETH Blockchain. Unique,metaverse-ready, and designed to benefit their holders.',
                style: TextStyles.body.copyWith(
                  fontSize: 15,
                  height: 1.5,
                  wordSpacing: 1,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    style: zeusOutlineButtonStyle.copyWith(
                      backgroundColor: MaterialStateProperty.all(
                        ZeusColors.primary,
                      ),
                      side: MaterialStateProperty.all(
                        const BorderSide(
                          color: ZeusColors.primary,
                          width: 1,
                        ),
                      ),
                      maximumSize: MaterialStateProperty.all(
                        const Size(180, 50),
                      ),
                    ),
                    onPressed: () {},
                    child: AutoSizeText(
                      "Connect Wallet",
                      style: TextStyles.body.copyWith(
                          color: const Color(0xff141B22),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    style: zeusOutlineButtonStyle.copyWith(
                      side: MaterialStateProperty.all(
                        const BorderSide(
                          color: ZeusColors.primary,
                          width: 2,
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        Colors.transparent,
                      ),
                      maximumSize: MaterialStateProperty.all(
                        const Size(180, 50),
                      ),
                    ),
                    onPressed: () {},
                    child: AutoSizeText(
                      "Whitelist Now",
                      style: TextStyles.body.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NavigationButtons extends StatelessWidget {
  const NavigationButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xff141B22),
          child: SvgPicture.asset(
            Assets.images.sun.path,
            height: 20,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        TextButton(
          style: flatButtonStyle,
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                Assets.images.discord.path,
                height: 18,
              ),
              const SizedBox(
                width: 8,
              ),
              AutoSizeText(
                "DISCORD",
                style: TextStyles.body.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        TextButton(
          style: flatButtonStyle.copyWith(
            backgroundColor: MaterialStateProperty.all(
              ZeusColors.primary,
            ),
          ),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                Assets.images.wallet.path,
                height: 18,
              ),
              const SizedBox(
                width: 8,
              ),
              AutoSizeText(
                "CONNECT",
                style: TextStyles.body.copyWith(
                  color: const Color(0xff141B22),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ],
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

class NavigationItems extends StatelessWidget {
  const NavigationItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {},
          child: const AutoSizeText(
            "HOME",
            style: TextStyles.body,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const AutoSizeText(
            "ABOUT",
            style: TextStyles.body,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const AutoSizeText(
            "ROADMAP",
            style: TextStyles.body,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const AutoSizeText(
            "COLLECTION",
            style: TextStyles.body,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const AutoSizeText(
            "FAQS",
            style: TextStyles.body,
          ),
        ),
      ],
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
