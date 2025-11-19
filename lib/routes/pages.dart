import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_17/binding/login_binding.dart';
import 'package:pas_mobile_11pplg2_17/binding/mainmenu_binding.dart';
import 'package:pas_mobile_11pplg2_17/binding/register_binding.dart';
import 'package:pas_mobile_11pplg2_17/binding/splashScreen_binding.dart';
import 'package:pas_mobile_11pplg2_17/pages/login_page.dart';
import 'package:pas_mobile_11pplg2_17/pages/mainmenu_page.dart';
import 'package:pas_mobile_11pplg2_17/pages/register_page.dart';
import 'package:pas_mobile_11pplg2_17/pages/splashscreen_page.dart';
import 'package:pas_mobile_11pplg2_17/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.loginApiPage, page: ()=> LoginAPIPage(), binding: LoginApiBinding()),
    GetPage(name: AppRoutes.registerApiPage, page: ()=> RegisterAPIPage(), binding: RegisterApiBinding()),
    GetPage(name: AppRoutes.splashScreenPage, page: ()=> SplashscreenPage(), binding: SplashscreenBinding()),
    GetPage(name: AppRoutes.mainMenuPage, page: ()=> MainmenuPage(), binding: MainmenuBinding()),
  ];
}