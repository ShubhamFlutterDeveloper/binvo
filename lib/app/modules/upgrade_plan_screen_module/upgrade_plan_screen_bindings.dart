import 'package:binvo/app/modules/upgrade_plan_screen_module/upgrade_plan_screen_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class UpgradePlanScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpgradePlanScreenController());
  }
}