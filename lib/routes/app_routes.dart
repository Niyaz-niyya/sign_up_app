import 'package:get/get.dart';

import '../presentation/pages/home_page.dart';
import '../presentation/pages/login_page.dart';
import '../presentation/pages/signup_page.dart';

class AppRoutes {
  static const String login = "/login";
  static const String signup = "/signup";
  static const String home = "/home";

  static final pages = [
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: signup, page: () => SignupPage()),
    GetPage(name: home, page: () => HomePage()),
  ];
}