import 'package:get/get.dart';

import 'package:pas_mobile_11pplg2_17/controllers/login_controller.dart';

class LoginApiBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(LoginAPIController());
  }
  

}