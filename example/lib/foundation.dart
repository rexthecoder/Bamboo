import 'package:bamboo/bamboo.dart';
import 'package:bamboo/foundation/foundation.dart';
import 'package:flutter/material.dart';

class FoundationWidget extends StatelessWidget {
  const FoundationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bambooBreakPoint = BambooBreakPoint.of(context);
    return Scaffold(
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
              Text("Mobile ${context.isMobile}"),
              Text("Tablet ${context.isTablet}"),
              Text("Desktop ${context.isDesktop}"),
              Text("Large ${context.isLarge}"),
              Text("Orientation ${context.orientation}"),
              // BambooWidget(
              //   mobile: Container(
              //     height: 200,
              //     width: 200,
              //     color: Colors.white,
              //   ),
              //   desktop: Container(
              //     height: 200,
              //     width: 200,
              //     color: Colors.red,
              //   ),
              // ),

              BamboonOrientation(
                portrait: Container(
                  height: 200,
                  width: 200,
                  color: Colors.white,
                ),
                landscape: Container(
                  height: 200,
                  width: 200,
                  color: Colors.red,
                ),
              ),
              SizedBox(
                height: Bamboo.number(
                  context: context,
                  mobile: 3,
                  unit: Unit.p,
                ),
                width: Bamboo.number(
                  context: context,
                  mobile: 7.5,
                ),
                child: Card(
                  child: Container(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
