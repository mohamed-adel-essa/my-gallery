import 'package:get/get.dart';

import '../../features/login-screen/view/login_contoller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginContoller>(() => LoginContoller());
  }
}
