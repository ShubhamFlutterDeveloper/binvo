import 'package:binvo/app/modules/fill_profile_screen_module/fill_profile_screen_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class FillProfileScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FillProfileScreenController());
  }
}