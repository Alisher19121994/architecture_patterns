import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/main_controller.dart';
import '../controller/payment_controller.dart';
import '../controller/settings_controller.dart';

class DIService {
  static Future<void> init() async {
    //Get.put<PaymentController>(PaymentController());

    //#lazyPut is for once the ui might be shown
    Get.lazyPut<MainController>(() => MainController(), fenix: true);
    Get.lazyPut<PaymentController>(() => PaymentController(), fenix: true);
    Get.lazyPut<SettingsController>(() => SettingsController(), fenix: true);
    Get.put<PaymentController>(PaymentController(),permanent: true);
  }
}