import 'package:binvo/app/modules/invoice_detail_module/invoice_detail_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class InvoiceDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InvoiceDetailController());
  }
}