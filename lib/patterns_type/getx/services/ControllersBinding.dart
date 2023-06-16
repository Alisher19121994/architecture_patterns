import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../controller/main_controller.dart';

class ControllersBinding implements Bindings {

  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<MainController>(MainController());
   // Get.put<PaymentController>(PaymentController());
   // Get.put<SettingController>(SettingController());
  }
}