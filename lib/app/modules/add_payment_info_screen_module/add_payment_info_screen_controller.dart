import 'package:flutter/material.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class AddPaymentInfoScreenController extends GetxController{
  TextEditingController editPayTextController=TextEditingController();
  bool isEditingText = false;
  var savetext="";
  final formKey = GlobalKey<FormState>();
  @override
  void onInit() {
    setText();
    super.onInit();
  }
  void setText() {
    savetext = editPayTextController.text;
    update();
  }
}
