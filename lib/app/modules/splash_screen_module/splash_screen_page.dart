import 'package:binvo/app/string/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:binvo/app/modules/splash_screen_module/splash_screen_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class SplashScreenPage extends GetView<SplashScreenController> {
  final splashScreenController = Get.find<SplashScreenController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: splashScreenController,
      builder: (context) {
        return Scaffold(
          backgroundColor: HexColor("#F3F5F9"),
          body: Center(
              child: SvgPicture.asset("assets/images/splashLogo.svg")),
        );
      },);
  }
}
