import 'package:binvo/app/modules/bill_creation_module/bill_creation_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class BillCreationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BillCreationController());
  }
}