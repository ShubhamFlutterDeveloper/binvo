import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:binvo/app/modules/add_payment_info_screen_module/add_payment_info_screen_controller.dart';
import 'package:sizer/sizer.dart';

import '../../helper_widget/TextField_widget.dart';
import '../../helper_widget/text_widget.dart';
import '../../string/hexcolor.dart';
import '../../theme/app_colors.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class AddPaymentInfoScreenPage extends GetView<AddPaymentInfoScreenController> {
  final addPaymentInfoScreenController = Get.find<AddPaymentInfoScreenController>();

  @override
  Widget build(BuildContext context) {
    return
      GetBuilder(
          init: addPaymentInfoScreenController,
          builder: (_)
          {
            return
              Scaffold(
                bottomNavigationBar: Padding(
                  padding:  EdgeInsets.symmetric(vertical: 3.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Divider(color: HexColor("#F3F5F9"), height: 3,thickness: 1,),
                      SizedBox(height: 2.h,),
                      TextWidget(text: "Delete Payment Info", size: 10.5.sp, bold: FontWeight.normal,color: HexColor("#CC4254"),   alignment: TextAlign.center),

                    ],
                  ),
                ),
                  backgroundColor: HexColor("#FFFFFF"),
                  body: ListView(
                    children: [
                      Container(
                        height: 4.h, width: double.maxFinite, color: Colors.white,),
                      Container(
                          padding: EdgeInsets.only(left: 4.w,right: 4.w,bottom: 1.h),
                          color: Colors.white,
                          height: 4.h,
                          width: double.maxFinite,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap:(){Get.back();},
                                child: TextWidget(text: "Cancel",
                                  size: 11.sp,
                                  bold: FontWeight.w400,
                                  color: HexColor("#5141BF"), ),),
                              Padding(
                                padding:  EdgeInsets.only(left: 3.5.w),
                                child: TextWidget(text: "Add payment info",
                                  size: 12.sp,
                                  bold: FontWeight.w500,
                                  color: primaryTextColor, ),
                              ),

                              addPaymentInfoScreenController.editPayTextController.text.isNotEmpty?TextWidget(text: "Edit",
                                size: 11.sp,
                                bold: FontWeight.w400,
                                color:HexColor("#5141BF"),
                              ):TextWidget(text: "Save",
                                size: 11.sp,
                                bold: FontWeight.w400,
                                color: addPaymentInfoScreenController.editPayTextController.text.isEmpty?
                                HexColor("#B4B5BD"):HexColor("#5141BF"),
                              ),
                            ],
                          )
                      ),
                      Divider(
                        height: 1.h,
                        thickness:0.2.w ,
                        color:HexColor("#F3F5F9"),
                      ),
                      SizedBox(height: 0.7.h,),
                      Padding(
                        padding: EdgeInsets.only(right:2.8.w,left: 2.8.w),
                        child:
                        TextWidget(text:"Saved payment information will be automatically added to invoices you send.", size: 10.sp,
                          bold: FontWeight.w500,color: HexColor("#5B5E67"),),
                      ),
                      SizedBox(height: 2.h,),
                      Form(
                          key: addPaymentInfoScreenController.formKey,
                          child: Padding(
                            padding: EdgeInsets.only(left:1.8.w ,right:1.8.w ),
                            child: SizedBox(
                              width: double.infinity,
                              height: 5.6.h,
                              child: TextFieldWidget(
                                fillColor:HexColor("#F3F5F9"),
                                cursorColor: Colors.black,
                                onChanged: (val) {
                                  addPaymentInfoScreenController.update();
                                },
                                hintText: "Account, paybill, till or phone number",
                                hintStyle: TextStyle(fontSize: 10.sp,color: HexColor("#777A85")),
                                controller: addPaymentInfoScreenController.editPayTextController,
                              ),
                            ),
                          )
                      ),
                      SizedBox(height: 0.9.h,),
                      addPaymentInfoScreenController.editPayTextController.text.isEmpty?
                      SizedBox.shrink():
                      Padding(
                        padding: EdgeInsets.only(right:2.5.w,left: 2.5.w),
                        child:
                        TextWidget(text:"Changes you make to payment info will be reflected in new invoices. Old invoices will not be affected.", size: 10.5.sp,
                          bold: FontWeight.w500,color: HexColor("#5B5E67"),),
                      ),
                      addPaymentInfoScreenController.editPayTextController.text.isEmpty?
                      SizedBox(height: 6.h,):
                      SizedBox(height: 9.h,),
                      TextWidget(text:'Examples of payment info formats', size:  10.sp, bold: FontWeight.normal,color: HexColor("#777A85"),
                        alignment: TextAlign.center,),
                      SizedBox(height: 4.h,),
                      TextWidget(text: "Bank name, account number", size:  10.sp, bold: FontWeight.normal,color: HexColor("#93969F"),   alignment: TextAlign.center),
                      SizedBox(height: 4.h,),
                      TextWidget(text: "Mobile money name, phone number", size: 10.sp, bold: FontWeight.normal,color: HexColor("#93969F"),   alignment: TextAlign.center),
                      SizedBox(height: 4.h,),
                      TextWidget(text: "Mobile money, Till no.", size: 10.sp, bold: FontWeight.normal,color: HexColor("#93969F") ,  alignment: TextAlign.center),
                      SizedBox(height: 4.h,),
                      TextWidget(text: "Mobile money Paybill no., business no.", size: 10.sp, bold: FontWeight.normal,color: HexColor("#93969F"),   alignment: TextAlign.center),
                      SizedBox(height: 4.h,),
                      TextWidget(text: "Paypal, email address", size: 10.sp, bold: FontWeight.normal,color: HexColor("#93969F"),   alignment: TextAlign.center),
                      SizedBox(height: 15.h,),


                    ],
                  )
              );
          }
      );
  }
}


