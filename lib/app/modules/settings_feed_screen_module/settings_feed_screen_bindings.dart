import 'package:binvo/app/modules/settings_feed_screen_module/settings_feed_screen_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class SettingsFeedScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsFeedScreenController());
  }
}