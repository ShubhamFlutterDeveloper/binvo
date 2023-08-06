import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:binvo/app/modules/account_edit_screen_module/account_edit_screen_controller.dart';
import 'package:sizer/sizer.dart';

import '../../../api_collection/dio_api_method.dart';
import '../../../api_collection/shared_prefrences.dart';
import '../../helper_widget/TextField_widget.dart';
import '../../helper_widget/button.dart';
import '../../helper_widget/text_widget.dart';
import '../../routes/app_pages.dart';
import '../../string/hexcolor.dart';
import '../../theme/app_colors.dart';
import '../settings_feed_screen_module/settings_feed_screen_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class AccountEditScreenPage extends GetView<AccountEditScreenController> {
  final SettingsFeedScreenController settingsFeedScreenController =
  Get.put<SettingsFeedScreenController>(SettingsFeedScreenController());
  final accountEditScreenController = Get.find<AccountEditScreenController>();

  @override
  Widget build(BuildContext context) {
    return
      GetBuilder(
        init: accountEditScreenController,
        builder: (_)
    {
      return
        Scaffold(
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
                              size: 12.sp,
                              bold: FontWeight.w600,
                              color: HexColor("#5141BF"), ),),
                        TextWidget(text: "Edit profile",
                          size: 12.sp,
                          bold: FontWeight.w600,
                          color: primaryTextColor,
                        alignment: TextAlign.center,),

                        GestureDetector(
                          onTap: (){
                            if(accountEditScreenController.image !=null){
                              if (accountEditScreenController.profileTextController.text.isNotEmpty) {
                                if  (accountEditScreenController.isImageApiHit == true){
                                  DioClient.get().toAst("Loading...");
                                  return;
                                }
                                accountEditScreenController.isLoading = true;
                                accountEditScreenController.completeProfileApi();
                                accountEditScreenController.update();
                              }

                            }
                            else {
                              accountEditScreenController.withoutProfileApi();
                              accountEditScreenController.update();
                            }

                          },
                          child: TextWidget(text: "Save",
                            size: 12.sp,
                            bold: FontWeight.w600,
                            color: accountEditScreenController.profileTextController.text.isEmpty?HexColor("#B4B5BD"):HexColor("#5141BF"),
                          ),
                        ),
                      ],
                    )
                ),
                SizedBox(height: 0.7.h,),
                Divider(
                  height: 1.h,
                  thickness:0.2.w ,
                  color:HexColor("#F3F5F9"),
                ),
                SizedBox(height: 0.7.h,),
                Center(
                    child: GestureDetector(
                      onTap: () {
                        accountEditScreenController.showPicker(context);
                      },
                      child:
                      accountEditScreenController.image != null
                          ?
                      Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              accountEditScreenController.showPicker(context);
                            },
                            child: CircleAvatar(
                                radius: 6.h,
                                backgroundColor: HexColor("#F3F5F9"),
                                child: CircleAvatar(
                                  radius: 5.8.h,
                                  backgroundColor:HexColor("#F3F5F9"),
                                  backgroundImage: Image.file(
                                    accountEditScreenController.image!,
                                    fit: BoxFit.cover,
                                  ).image,

                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.h, left: 8.h),
                            child: CircleAvatar(
                                radius: 2.h,
                                backgroundColor: HexColor("#F3F5F9"),
                                child: Icon(Icons.edit, color: Colors.black, size: 2.h,)),
                          )
                        ],
                      )
                          : CircleAvatar(
                        radius: 6.h,
                        backgroundColor: HexColor("#F3F5F9"),
                        backgroundImage: NetworkImage("http://binvo.deploywork.com${settingsFeedScreenController.getMyDetailResponse.body?.profilePic}"),
                      ),
                    )),
                SizedBox(height: 2.h,),
                GestureDetector(
                    onTap: (){
                      accountEditScreenController.showPicker(context);

                    },
                    child: TextWidget(text: 'Set photo', size: 12.sp, bold: FontWeight.normal,color: HexColor("#5141BF"),alignment: TextAlign.center,)),

                SizedBox(height: 5.h,),
                Padding(
                  padding:EdgeInsets.only(left: 4.w,right: 4.w),
                  child: Form(
                    key: accountEditScreenController.formKey,
                    child: TextFieldWidget(
                        onChanged: (val){
                          accountEditScreenController.update();
                        },
                        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 2.w),
                        hintText: settingsFeedScreenController.getMyDetailResponse.body?.name??"Your Name",
                        hintStyle: TextStyle(color: HexColor('#777A85'),
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp),
                        controller:accountEditScreenController.profileTextController ),
                  ),
                ),
                SizedBox(height: 3.h,),
                Padding(
                  padding:EdgeInsets.only(left: 4.w,right: 4.w),
                  child: TextWidget(text: 'PHONE  NUMBER', size: 7.8.sp, bold: FontWeight.normal,color: HexColor("#777A85")),
                ),
                SizedBox(height: 1.h,),
                Padding(
                  padding:EdgeInsets.only(left: 4.w,right: 4.w),
                  child: TextWidget(text:"+${ settingsFeedScreenController.getMyDetailResponse.body?.countryCode.toString()??"No Number"} ${ settingsFeedScreenController.getMyDetailResponse.body?.mobileNo.toString()??"No Number"}", size: 11.sp, bold: FontWeight.w500 ,color: HexColor("#777A85")),
                ),
                SizedBox(height:40.h,),
                GestureDetector(
                    onTap: ()async{
                      await PreferenceManager.get().preferenceClear();
                      await PreferenceManager.get().setMainOnBoardValue(true);
                      Get.offAllNamed(Routes.REGISTRATION_SCREEN);
                    },
                    child: TextWidget(text: 'Logout', size: 8.sp, bold: FontWeight.normal,color: HexColor("#777A85"),alignment: TextAlign.center,)),
                SizedBox(height:2.h,),
                TextWidget(text: 'Delete account', size: 8.sp, bold: FontWeight.normal,color: HexColor("#777A85"),alignment: TextAlign.center,),

              ],
            )
        );
    }
      );
  }
}
