import 'package:get/get.dart';

import 'package:pas_mobile_11pplg2_17/controllers/register_controller.dart';

class RegisterApiBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(RegisterAPIController());
  }
  

}