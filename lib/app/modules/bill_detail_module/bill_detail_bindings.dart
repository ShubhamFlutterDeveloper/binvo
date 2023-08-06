import 'package:binvo/app/modules/bill_detail_module/bill_detail_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class BillDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BillDetailController());
  }
}