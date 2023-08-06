import 'package:binvo/api_collection/dio_api_method.dart';
import 'package:binvo/app/helper_widget/CountryList/countryListPick.dart';
import 'package:binvo/app/theme/app_colors.dart';
import 'package:country_list_pick/country_selection_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:binvo/app/modules/registration_screen_module/registration_screen_controller.dart';
import 'package:sizer/sizer.dart';
import '../../helper_widget/TextField_widget.dart';
import '../../helper_widget/button.dart';
import '../../helper_widget/text_widget.dart';
import '../../string/hexcolor.dart';

class RegistrationScreenPage extends GetView<RegistrationScreenController> {
  final registrationScreenController = Get.find<RegistrationScreenController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: registrationScreenController,
        builder: (_) {
          return Scaffold(
            backgroundColor: HexColor("#FFFFFF"),
              body: ListView(
            children: [
              SizedBox(
                height: 11.h,
              ),
              TextWidget(
                text: "binvo",
                size: 22.sp,
                bold: FontWeight.w800,
                color: HexColor('#382D84'),
                alignment: TextAlign.center,
              ),
              SizedBox(
                height: 1.h,
              ),
              TextWidget(
                alignment: TextAlign.center,
                text: "Peer to peer invoicing and bill reminders",
                size: 12.sp,
                bold: FontWeight.normal,
                color: HexColor("#282A38"),
              ),
              SizedBox(
                height: 4.h,
              ),
              TextWidget(
                alignment: TextAlign.center,
                text: "Sign up with your phone number",
                size: 14.sp,
                bold: FontWeight.bold,
                color: HexColor("#282A38"),
              ),
              SizedBox(
                height: 1.h,
              ),
              TextWidget(
                alignment: TextAlign.center,
                text: "Binvo will SMS you a verification code ",
                size: 11.sp,
                bold: FontWeight.normal,
                color: HexColor("#282A38"),
              ),
              SizedBox(
                height: 4.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.w, right: 4.w),
                child: Row(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: HexColor('#F3F5F9')),
                        height: 6.5.h,
                        width: 29.w,
                        child:  CountryListPick(
                          appBar: AppBar(
                            backgroundColor: Colors.white,
                            elevation: 0,
                              centerTitle: true,
                              actions: [
                                Padding(
                                  padding:  EdgeInsets.only(top: 2.h,right: 4.w),
                                  child: TextWidget(text: "Done", size: 12.sp, bold: FontWeight.w600,color: HexColor("#5141BF"),),
                                ),
                              ],
                              title: TextWidget(text: "Country code", size: 12.sp, bold: FontWeight.w600,color: HexColor("#282A38"),)
                          ),
                          theme: CountryTheme(
                            isShowFlag: false,
                            isShowTitle: false,
                            isShowCode: true,
                            isDownIcon: true,
                            showEnglishName: true,
                          ),
                          initialSelection: registrationScreenController.selectedCountryCode.toString(),
                          onChanged: registrationScreenController.onCountryChange,
                        ),),
                    SizedBox(width: 2.w,),
                    Expanded(
                      child: TextFieldWidget(
                          textInputAction: TextInputAction.next,
                          textInputFormatter:LengthLimitingTextInputFormatter(16),
                          contentPadding: EdgeInsets.only(top: 0.1.h, left: 1.5.w),
                          cursorColor: Colors.black,
                          onChanged: (val) {
                            registrationScreenController.update();
                            print("test${registrationScreenController.textController}");
                          },
                          hintText: "",
                          controller: registrationScreenController
                              .textController,
                          textInputType: TextInputType.phone),
                    )
                  ],
                ),
              ),
              SizedBox(height: 5.h,),
              registrationScreenController.isLoading==false
                  ? Button(
                firstWidget: TextWidget(
                  text: "Continue",
                  size: 13.sp,
                  bold: FontWeight.normal,
                ),
                onPressed: () {
                  if(registrationScreenController.textController.text.isNotEmpty){
                    if (registrationScreenController.textController.text.length < 10) {
                      DioClient.get().toAst("Please enter a valid mobile number");
                      return;
                    }
                    FocusManager.instance.primaryFocus?.unfocus();
                    registrationScreenController.isLoading = true;
                    registrationScreenController.registrationApi();
                    registrationScreenController.update();
                  }
                },
                backGroundColor: registrationScreenController.textController.text.isNotEmpty
                    ? HexColor("#5141BF")
                    : HexColor("#D7D3F0"),
              )
                  : Center(child: CircularProgressIndicator(
                color: primaryTextColor,
              ))
            ],
          ));
        });
  }
}
