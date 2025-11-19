import 'package:get/get.dart';

import 'package:pas_mobile_11pplg2_17/controllers/mainmenu_controller.dart';

class MainmenuBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(MainmenuController());
  }
  

}