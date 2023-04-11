import 'package:flutter/animation.dart';
import 'package:gallery/features/login-screen/view/login_screen.dart';
import 'package:get/get.dart';

class SplashScreenContoller extends GetxController {
  final TickerProvider tickerProvider;
  SplashScreenContoller({required this.tickerProvider});

  bool expanded = false;
  late AnimationController _lottieAnimation;
  AnimationController get lottieAnimation => _lottieAnimation;

  @override
  void onInit() {
    try {
      _lottieAnimation = AnimationController(
        vsync: tickerProvider,
        duration: const Duration(seconds: 1),
      );
      Future.delayed(const Duration(seconds: 1))
          .then((value0) {
            expanded = true;
            update();
          })
          .then((value1) => const Duration(seconds: 1))
          .then(
            (value2) => Future.delayed(const Duration(seconds: 1)).then(
              (value3) => _lottieAnimation.forward().then(
                (value4) async {
                  Get.off(() => const LoginScreen());
                },
              ),
            ),
          );
    } catch (e) {}
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _lottieAnimation.dispose();
  }
}
