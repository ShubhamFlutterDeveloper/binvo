import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:binvo/app/modules/verification_screen_module/verification_screen_controller.dart';
import 'package:sizer/sizer.dart';
import '../../helper_widget/text_widget.dart';
import '../../routes/app_pages.dart';
import '../../string/hexcolor.dart';

class VerificationScreenPage extends GetView<VerificationScreenController> {
  final verificationScreenController=Get.find<VerificationScreenController>();
  @override
  Widget build(BuildContext context) {
    return  GetBuilder(
      init: verificationScreenController,
      builder: (_) {
        return Scaffold(
          backgroundColor: HexColor("#FFFFFF"),
          body: ListView(
            children: [
              SizedBox(height:20.h,),
              TextWidget(text: "Enter verification code", size: 13.sp, bold: FontWeight.bold,color:HexColor("#282A38"),alignment: TextAlign.center,),
              SizedBox(height: 1.h,),
              Row(
                mainAxisAlignment:  MainAxisAlignment.center,
                children: [
                  TextWidget(text: "Sent to ${verificationScreenController.arg}", size: 12.sp, color:HexColor("#5B5E67"),bold: FontWeight.w500),
                  SizedBox(width: 1.w,),
                  Container(
                    height: 0.7.h,
                    width: 1.5.w,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.w),color: HexColor("#5B5E67")),),
                  SizedBox(width: 2.w,),
                  GestureDetector(
                      onTap: (){Get.toNamed(Routes.REGISTRATION_SCREEN);},
                      child: TextWidget(text: "Edit", size:12.sp, bold:FontWeight.bold,color: HexColor("#5141BF")))
                ],
              ),
              SizedBox(height: 8.h,),
              Padding(
                padding: EdgeInsets.only(left: 4.w,right: 4.w),
                child:  OtpTextField(
                  keyboardType: TextInputType.number,
                  showCursor: true,
                  autoFocus:false,
                  enabled: true,
                  cursorColor: Colors.black,
                  numberOfFields: 6,
                  fieldWidth: 13.w,
                  showFieldAsBox: true,
                  fillColor: HexColor('#F3F5F9'),
                  filled: true,
                  enabledBorderColor: HexColor('#F3F5F9') ,
                  focusedBorderColor:  HexColor('#F3F5F9'),
                  onCodeChanged: (String code) {
                  },
                  onSubmit: (String verificationCode){
                    verificationScreenController.otpCode = verificationCode;
                    verificationScreenController.verifyOtpApi();
                    verificationScreenController.update();
                  }, // end onSubmit
                ),
              ),
              SizedBox(height: 1.h),
              verificationScreenController.isCodeInvalid == true
                  ? Center(child: TextWidget(text: "Please enter a valid code", size: 12.sp, bold: FontWeight.normal,color: HexColor("#CC4254")))
                  : SizedBox.shrink(),
              SizedBox(height: verificationScreenController.isCodeInvalid == true ? 6.h : 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      if(verificationScreenController.remainingSeconds == 0){
                        verificationScreenController.remainingSeconds = 30;
                        verificationScreenController.update();
                        verificationScreenController.startTimer();
                      }
                    },
                    child: TextWidget(text: "Resend code", size:12.sp, bold:FontWeight.normal, color: verificationScreenController.remainingSeconds == 0 ? HexColor("#5141BF") : HexColor("#B4B5BD"))),
                 TextWidget(text: " in 00:${verificationScreenController.remainingSeconds.toString().padLeft(2,"0")}", size:12.sp, bold:FontWeight.normal),
                ],
              )
            ],
          ),
        );
      },);
  }
}
