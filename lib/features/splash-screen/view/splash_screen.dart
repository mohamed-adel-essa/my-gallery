import 'package:flutter/material.dart';
import 'package:gallery/features/splash-screen/view/splash_contoller.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenContoller>(
        init: SplashScreenContoller(tickerProvider: this),
        builder: (splashScreenContoller) {
          return Material(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedCrossFade(
                    firstCurve: Curves.fastOutSlowIn,
                    crossFadeState: !splashScreenContoller.expanded
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: const Duration(seconds: 1),
                    firstChild: Container(),
                    secondChild: FlutterLogo(size: 20.w),
                    alignment: Alignment.centerLeft,
                    sizeCurve: Curves.easeInOut,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
