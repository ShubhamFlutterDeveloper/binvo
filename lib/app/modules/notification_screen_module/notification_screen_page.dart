import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:binvo/app/modules/notification_screen_module/notification_screen_controller.dart';
import 'package:sizer/sizer.dart';

import '../../helper_widget/text_widget.dart';
import '../../string/hexcolor.dart';
import '../../theme/app_colors.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class NotificationScreenPage extends GetView<NotificationScreenController> {
  final notificationScreenController = Get.find<NotificationScreenController>();

  @override
  Widget build(BuildContext context) {
    return
      GetBuilder(
          init: notificationScreenController,
          builder: (_)
          {
            return
              Scaffold(
                  backgroundColor: HexColor("#F5F5F5"),
                  body: ListView(
                    children: [
                      Container(
                        height: 4.h, width: double.maxFinite, color: Colors.white,),
                      Container(
                          padding: EdgeInsets.only(left: 4.w,right: 4.w,bottom: 1.h),
                          color: Colors.white,
                          height: 4.h,
                          width: double.maxFinite,
                          child:Row(
                            children: [
                              SizedBox(width: 0.5.w,),
                              GestureDetector(
                                  onTap: (){},
                                  child: Image.asset('assets/images/CaretLeft.png',height: 3.2.h,)),
                              SizedBox(width: 28.w,),
                              Text('Notifications',style: TextStyle(color: Colors.black,fontSize: 12.sp,fontWeight: FontWeight.w500)),
                            ],
                          ),
                      ),
                      SizedBox(height: 0.7.h,),
                      Divider(
                        height: 1.h,
                        thickness:0.2.w ,
                        color:HexColor("#F3F5F9"),
                      ),
                      SizedBox(height: 1.5.h,),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 4.w),
                        child: TextWidget(text: "Bills",
                          size: 11.sp,
                          bold: FontWeight.w600,
                          color: HexColor("#93969F"),),
                      ),
                      SizedBox(height: 1.5.h,),
                      Container(
                          color: Colors.white,
                          height: 14.h,
                          width: double.maxFinite,
                          padding: EdgeInsets.only(left: 4.w, right: 4.w),
                          child: Column(
                            children: [
                              SizedBox(height: 2.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 TextWidget(text: "New bill notification",
                                     size: 12.sp,
                                     bold: FontWeight.w500,
                                     color: primaryTextColor),
                                 FlutterSwitch(
                                   width: 10.4.w,
                                   height: 3.h,
                                   toggleSize: 15.sp,
                                   value:notificationScreenController.toggleValue,
                                   borderRadius: 30.0,
                                   padding: 0.0,
                                   toggleColor: Colors.white,
                                   switchBorder: Border.all(
                                     color: HexColor('#5141BF'),
                                     width: 0.5.w,
                                   ),
                                   toggleBorder: Border.all(
                                     strokeAlign:0.8.sp,
                                     color: HexColor('#5141BF'),
                                     width:0.5.w,
                                   ),
                                   activeColor:HexColor('#5141BF'),
                                   inactiveColor: Colors.white,
                                   onToggle: (value) {
                                     notificationScreenController.toggleValue= value;
                                     notificationScreenController.update();
                                   },
                                 ),
                               ],
                              ),
                              SizedBox(height: 1.h,),
                              Divider(thickness: 0.2.w,color: HexColor("#F3F5F9"),),
                              SizedBox(height: 1.h,),
                              GestureDetector(
                                onTap: (){
                                  notificationScreenController.showAlertDialog(context);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget(text: "Due date reminder",
                                        size: 12.sp,
                                        bold: FontWeight.w500,
                                        color: primaryTextColor),
                                    Row(
                                      children: [
                                        TextWidget(text: notificationScreenController.selectedItems.isNotEmpty? notificationScreenController.selectedItems.join(""):notificationScreenController.itemList.first,
                                            size: 11.sp,
                                            bold: FontWeight.normal,
                                            color: primaryTextColor),
                                        SizedBox(width: 2.w,),
                                        Icon(
                                          Icons.arrow_forward_ios_outlined, size: 1.8.h,
                                          color: primaryTextColor,),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 1.h,),
                            ],
                          )
                      ),
                      SizedBox(height: 3.h,),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 4.w),
                        child: TextWidget(text: "Invoices",
                          size: 11.sp,
                          bold: FontWeight.w600,
                          color: HexColor("#93969F"),),
                      ),
                      SizedBox(height: 1.5.h,),
                      Container(
                          color: Colors.white,
                          height: 7.h,
                          width: double.maxFinite,
                          padding: EdgeInsets.only(left: 4.w, right: 4.w),
                          child: Column(
                            children: [
                              SizedBox(height: 2.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextWidget(text: "Receipt attachment",
                                      size: 12.sp,
                                      bold: FontWeight.w500,
                                      color: primaryTextColor),
                                  FlutterSwitch(
                                    width: 10.4.w,
                                    height: 3.h,
                                    toggleSize: 15.sp,
                                    value:notificationScreenController.toggleValue1,
                                    borderRadius: 30.0,
                                    padding: 0.0,
                                    toggleColor: Colors.white,
                                    switchBorder: Border.all(
                                      color: HexColor('#5141BF'),
                                      width: 0.5.w,
                                    ),
                                    toggleBorder: Border.all(
                                      strokeAlign:0.8.sp,
                                      color: HexColor('#5141BF'),
                                      width:0.5.w,
                                    ),
                                    activeColor:HexColor('#5141BF'),
                                    inactiveColor: Colors.white,
                                    onToggle:  (value) {
                                      notificationScreenController.toggleValue1= value;
                                      notificationScreenController.update();
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 1.h,),
                            ],
                          )
                      ),
                      SizedBox(height: 1.8.h,),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 3.w),
                        child: TextWidget(text: "Notify me when receipts are attached to invoices I have sent",
                            size: 11.2.sp,
                            bold: FontWeight.w500,
                            color: primaryTextColor),
                      ),
                      SizedBox(height: 3.5.h,),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 4.w),
                        child: TextWidget(text: "Haptic feedback",
                          size: 11.sp,
                          bold: FontWeight.w600,
                          color: HexColor("#93969F"),),
                      ),
                      SizedBox(height: 1.5.h,),
                      Container(
                          color: Colors.white,
                          height: 7.h,
                          width: double.maxFinite,
                          padding: EdgeInsets.only(left: 4.w, right: 4.w),
                          child: Column(
                            children: [
                              SizedBox(height: 2.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextWidget(text: "Vibrate on Mark as cleared",
                                      size: 11.sp,
                                      bold: FontWeight.w500,
                                      color: primaryTextColor),
                                  FlutterSwitch(
                                    width: 10.4.w,
                                    height: 3.h,
                                    toggleSize: 15.sp,
                                    value:notificationScreenController.toggleValue2,
                                    borderRadius: 30.0,
                                    padding: 0.0,
                                    toggleColor: Colors.white,
                                    switchBorder: Border.all(
                                      color: HexColor('#5141BF'),
                                      width: 0.5.w,
                                    ),
                                    toggleBorder: Border.all(
                                      strokeAlign:0.8.sp,
                                      color: HexColor('#5141BF'),
                                      width:0.5.w,
                                    ),
                                    activeColor:HexColor('#5141BF'),
                                    inactiveColor: Colors.white,
                                    onToggle:  (value) {
                                      notificationScreenController.toggleValue2= value;
                                      notificationScreenController.update();
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 1.h,),
                            ],
                          )
                      ),
                    ],
                  )
              );
          }
      );
  }
}

