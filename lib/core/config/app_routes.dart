import 'package:get/get.dart';
import 'package:loomi/presentation/pages/home/home_page_mock.dart';

import '../../presentation/pages/login/login_page.dart';
import '../../presentation/pages/login/register_page.dart';
import '../../presentation/pages/profile/profile_page.dart';

class AppRoutes {
  static const register = '/';
  static const login = '/login';
  static const home = '/home';
  static const profile = '/profile';

  static final routes = [
    GetPage(name: register, page: () => RegisterPage()), 
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: home, page: () => HomePageMock()),
    //GetPage(name: home, page: () => HomePage()),
    GetPage(name: profile, page: () => ProfilePage()),
  ];
}
