
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_17/controllers/splashscreen_controller.dart';


class SplashscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashscreenController());
  }
}