import 'package:binvo/app/modules/account_edit_screen_module/account_edit_screen_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class AccountEditScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccountEditScreenController());
  }
}