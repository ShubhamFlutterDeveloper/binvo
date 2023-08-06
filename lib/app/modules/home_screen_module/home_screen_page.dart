import 'package:binvo/app/string/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:binvo/app/modules/home_screen_module/home_screen_controller.dart';
import 'package:sizer/sizer.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class HomeScreenPage extends GetView<HomeScreenController> {
  final HomeScreenController homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: homeScreenController,
        builder: (logic) {
          return Scaffold(
            backgroundColor: Colors.white,
            bottomNavigationBar:
            BottomNavigationBar(
              currentIndex:  homeScreenController.currentIndex.value,
              onTap: (int index) {
                homeScreenController.onChangedFunction(index);
              },
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle: TextStyle(color: HexColor("#5141BF"), fontSize: 7.sp) ,
              unselectedLabelStyle: TextStyle(color:  HexColor("#5B5E67"), fontSize: 7.sp),
              unselectedItemColor: HexColor("#5B5E67"),
              selectedItemColor: HexColor("#5141BF"),
              showSelectedLabels: true,
              showUnselectedLabels: true,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Padding(
                padding: EdgeInsets.only(bottom: 0.5.h),
                      child: SvgPicture.asset("assets/images/biils.svg",height: 2.5.h,width: 2.w, color: homeScreenController.currentIndex==0?
                      HexColor("#5141BF"): HexColor("#5B5E67"),),
                    ),label: "Bills"),
                BottomNavigationBarItem(
                    icon:Padding(
                      padding: EdgeInsets.only(bottom: 0.5.h),
                      child: SvgPicture.asset("assets/images/invoices.svg",height: 2.5.h,width: 2.w,color: homeScreenController.currentIndex==1?
                      HexColor("#5141BF"): HexColor("#5B5E67")),
                    ),label: "Invoices"),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(bottom: 0.5.h),
                      child: SvgPicture.asset("assets/images/profile.svg",height: 2.5.h,width: 2.w,color: homeScreenController.currentIndex==2?
                      HexColor("#5141BF"): HexColor("#5B5E67")),
                    ),label: "Profile"),
              ],
            ),
            body: homeScreenController.widgetOptions.elementAt(homeScreenController.currentIndex.value),
          );
        });
  }

}
