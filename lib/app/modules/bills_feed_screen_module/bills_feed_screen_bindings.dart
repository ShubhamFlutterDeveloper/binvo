import 'package:binvo/app/modules/bills_feed_screen_module/bills_feed_screen_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class BillsFeedScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BillsFeedScreenController());
  }
}