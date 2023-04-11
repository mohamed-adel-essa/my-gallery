import 'package:gallery/features/home-scren/view/home_screen.dart';
import 'package:get/get.dart';

import '../../features/login-screen/view/login_screen.dart';
import '../../features/splash-screen/view/splash_screen.dart';

class AppRoutes {
  static String initialRoute = "/splash-screen";
  static String loginScreen = "/Login-screen";
  static String homeScreen = "/Home-screen";
  static List<GetPage> routes = [
    GetPage(name: initialRoute, page: () => const SplashScreen()),
    GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(name: homeScreen, page: () => const HomeScreen()),
  ];
}
