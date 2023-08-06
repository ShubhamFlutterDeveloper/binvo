import 'package:binvo/app/modules/map_screen_module/map_screen_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class MapScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MapScreenController());
  }
}