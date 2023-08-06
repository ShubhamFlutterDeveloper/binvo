import 'package:binvo/app/modules/invoices_feed_screen_module/invoices_feed_screen_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class InvoicesFeedScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InvoicesFeedScreenController());
  }
}