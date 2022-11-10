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
          margin: EdgeInsets.all(20),
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
              SizedBox(
                height: BamboomResponsive.number(
                  context: context,
                  mobile: 20,
                  unit: Unit.p,
                ),
                width: 200,
                child: Card(
                  child: BamboomResponsive.value(
                    context: context,
                    mobile: Container(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
