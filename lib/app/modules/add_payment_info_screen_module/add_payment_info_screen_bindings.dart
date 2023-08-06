import 'package:binvo/app/modules/add_payment_info_screen_module/add_payment_info_screen_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class AddPaymentInfoScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddPaymentInfoScreenController());
  }
}