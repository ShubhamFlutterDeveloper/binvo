import 'package:binvo/app/modules/registration_screen_module/registration_screen_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class RegistrationScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegistrationScreenController());
  }
}