import 'package:bamboo/bamboo.dart';
import 'package:flutter/material.dart';

class FoundationWidget extends StatelessWidget {
  const FoundationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bambooBreakPoint = BambooBreakPoint.of(context);
    return LayoutBuilder(builder: (context, c) {
      return Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            margin: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Color(0xff95D9FF),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Desktop Breakpoint ${bambooBreakPoint.desktop}'),
                Text('Normal Hieght ${context.height}'),
                Text('Mobile ${context.isMobile}'),
                Text('Tablet ${context.isTablet}'),
                Text('Desktop ${context.isDesktop}'),
                Text('Large ${context.isLarge}'),
                Text('Orientation ${context.orientation}'),
                BambooImage(
                  mobile: imageMobile,
                  desktop: imageDesktop,
                  builder: (context, path) {
                    return Image.network(path);
                  },
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

const imageMobile =
    'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-674010.jpg&fm=jpg';

const imageDesktop =
    'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-674010.jpg&fm=jpg';

const fallBackImage =
    'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-674010.jpg&fm=jpg';
