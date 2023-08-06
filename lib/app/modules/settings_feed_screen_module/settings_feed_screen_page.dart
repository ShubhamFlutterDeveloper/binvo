import 'package:binvo/app/helper_widget/text_widget.dart';
import 'package:binvo/app/string/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:binvo/app/modules/settings_feed_screen_module/settings_feed_screen_controller.dart';
import 'package:sizer/sizer.dart';

import '../../../api_collection/shared_prefrences.dart';
import '../../helper_widget/currencyPicker/currency.dart';
import '../../helper_widget/currencyPicker/currencyPicker.dart';
import '../../routes/app_pages.dart';
import '../../theme/app_colors.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class SettingsFeedScreenPage extends GetView<SettingsFeedScreenController> {
  final SettingsFeedScreenController settingsFeedScreenController =
  Get.put<SettingsFeedScreenController>(SettingsFeedScreenController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: settingsFeedScreenController,
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
                    color: Colors.white,
                    height: 4.h,
                    width: double.maxFinite,
                    child: TextWidget(text: "Profile",
                      size: 12.sp,
                      bold: FontWeight.w500,
                      color: primaryTextColor,
                      alignment: TextAlign.center,)
                ),
                SizedBox(height: 0.7.h,),
                Container(
                  color: Colors.white,
                  height: 11.h,
                  width: double.maxFinite,
                  child: Center(
                    child: ListTile(
                      onTap: (){
                        Get.toNamed(Routes.ACCOUNT_EDIT_SCREEN);
                      },
                      contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
                      leading:
                      CircleAvatar(
                        radius: 4.9.h,
                        backgroundColor: HexColor("#D9D9D9"),
                        backgroundImage: NetworkImage("http://binvo.deploywork.com${settingsFeedScreenController.getMyDetailResponse.body?.profilePic}"),
                      ),
                      title: Padding(
                        padding: EdgeInsets.only(bottom: 0.6.h),
                        child: TextWidget(text: settingsFeedScreenController.getMyDetailResponse.body?.name??"",
                            size: 14.sp,
                            bold: FontWeight.w500,
                            color: primaryTextColor),
                      ),
                      subtitle: TextWidget(text: "+${settingsFeedScreenController.getMyDetailResponse.body?.countryCode.toString()??""} ${settingsFeedScreenController.getMyDetailResponse.body?.mobileNo.toString()??""}",
                          size: 12.sp,
                          bold: FontWeight.w400,
                          color: HexColor("#5B5E67")),
                      trailing: Padding(
                        padding: EdgeInsets.only(right: 4.h),
                        child: SvgPicture.asset("assets/images/edit.svg"),
                      ),


                    ),
                  ),
                ),
                SizedBox(height: 1.8.h,),
                Padding(
                  padding: EdgeInsets.only(left: 3.8.w, right: 4.w),
                  child: TextWidget(text: "Bills and invoices options",
                      size: 11.sp,
                      bold: FontWeight.w500,
                      color: HexColor("#5B5E67")),
                ),
                SizedBox(height: 1.5.h,),
                Container(
                    color: Colors.white,
                    height: 20.h,
                    width: double.maxFinite,
                    padding: EdgeInsets.only(left: 4.w, right: 4.w),
                    child: Column(
                      children: [
                        ListTile(
                          onTap: (){
                            Get.toNamed(Routes.ADD_PAYMENT_INFO_SCREEN);
                          },
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 0.0),
                            minLeadingWidth: 0,
                            leading: Padding(
                              padding: EdgeInsets.only(top: 0.5.h,left: 1.w),
                              child: SvgPicture.asset(
                                  "assets/images/wallet.svg",height: 1.9.h,),
                            ),
                            title: TextWidget(text: "Payment info",
                                size: 12.sp,
                                bold: FontWeight.w400,
                                color: primaryTextColor),
                            trailing: Icon(
                              Icons.arrow_forward_ios_outlined, size: 1.8.h,
                              color: primaryTextColor,)


                        ),
                        ListTile(
                          onTap: (){
                            Get.toNamed(Routes.NOTIFICATION_SCREEN);
                          },
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 0.0),
                            minLeadingWidth: 0,
                            leading: Padding(
                              padding: EdgeInsets.only(top: 0.5.h,left: 1.w),
                              child: SvgPicture.asset(
                                  "assets/images/notificatiobs.svg",height: 1.9.h,),
                            ),
                            title: TextWidget(text: "Notifications",
                                size: 12.sp,
                                bold: FontWeight.w400,
                                color: primaryTextColor),
                            trailing: Icon(
                              Icons.arrow_forward_ios_outlined, size: 1.8.h,
                              color: primaryTextColor,)


                        ),
                        ListTile(
                          onTap: (){
                            showCurrencyPicker(
                              context: context,
                              showFlag: true,
                              showSearchField: true,
                              showCurrencyName: true,
                              showCurrencyCode: true,
                              onSelect: (Currency currency) {
                                settingsFeedScreenController.selectedCurrency=currency;
                                settingsFeedScreenController.update();
                                print('Select currency: ${currency.name}');
                              },
                            );
                          },
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 0.0),
                            minLeadingWidth: 0,
                            leading: Padding(
                              padding: EdgeInsets.only(top: 0.5.h,left: 1.w),
                              child: SvgPicture.asset(
                                  "assets/images/currency.svg",height: 1.4.h,),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextWidget(text: "Currency",
                                    size: 12.sp,
                                    bold: FontWeight.w400,
                                    color: primaryTextColor),
                                TextWidget(text:   settingsFeedScreenController.selectedCurrency?.code??"KSH",
                                    size: 12.sp,
                                    bold: FontWeight.w400,
                                    color: primaryTextColor),
                              ],
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_outlined, size: 1.8.h,
                              color: primaryTextColor,)


                        ),
                      ],
                    )
                ),
                SizedBox(height: 1.8.h,),
                Padding(
                  padding: EdgeInsets.only(left: 4.8.w, right: 4.w),
                  child: TextWidget(text: "Subscription",
                      size: 11.sp,
                      bold: FontWeight.w400,
                      color: HexColor("#5B5E67")),
                ),
                SizedBox(height: 1.5.h,),
                Container(
                  color: Colors.white,
                  height: 9.h,
                  width: double.maxFinite,
                  padding: EdgeInsets.only(left: 4.w, right: 4.w),
                  child: ListTile(
                    onTap: (){
                      Get.toNamed(Routes.UPGRADE_PLAN_SCREEN);
                    },
                      contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
                      minLeadingWidth: 0,
                      leading: Padding(
                        padding: EdgeInsets.only(top: 1.8.h,left: 2.w),
                        child: SvgPicture.asset("assets/images/star.svg",height: 1.7.h),
                      ),
                      title: Padding(
                        padding: EdgeInsets.only(bottom: 0.6.h),
                        child: TextWidget(text: "Upgrade",
                            size: 12.sp,
                            bold: FontWeight.w400,
                            color: primaryTextColor),
                      ),
                      subtitle: Padding(
                        padding: EdgeInsets.only(bottom: 0.9.h),
                        child: TextWidget(text: "Current plan: Free",
                            size: 10.sp,
                            bold: FontWeight.w400,
                            color: primaryTextColor),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined, size: 1.8.h,
                        color: primaryTextColor,)


                  ),
                ),
                SizedBox(height: 1.8.h,),
                Padding(
                  padding: EdgeInsets.only(left: 4.8.w, right: 4.w),
                  child: TextWidget(text: "Backup",
                      size: 11.sp,
                      bold: FontWeight.w400,
                      color: HexColor("#5B5E67")),
                ),
                SizedBox(height: 1.5.h,),
                Container(
                  color: Colors.white,
                  height: 7.h,
                  width: double.maxFinite,
                  padding: EdgeInsets.only(left: 4.w, right: 4.w),
                  child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
                      minLeadingWidth: 0,
                      leading: Padding(
                        padding: EdgeInsets.only(top: 0.5.h,left: 2.w),
                        child: SvgPicture.asset("assets/images/backup.svg",height: 1.6.h,),
                      ),
                      title: TextWidget(text: "Backup and restore",
                          size: 12.sp,
                          bold: FontWeight.w400,
                          color: primaryTextColor),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined, size: 1.8.h,
                        color: primaryTextColor,)


                  ),
                ),
                SizedBox(height: 1.8.h,),
                Padding(
                  padding: EdgeInsets.only(left: 4.8.w, right: 4.w),
                  child: TextWidget(text: "Social",
                      size: 11.sp,
                      bold: FontWeight.w500,
                      color: HexColor("#5B5E67")),
                ),
                SizedBox(height: 1.5.h,),
                Container(
                    color: Colors.white,
                    height: 23.8.h,
                    width: double.maxFinite,
                    padding: EdgeInsets.only(left: 4.w, right: 4.w),
                    child: Column(
                      children: [
                        ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 0.0),
                            minLeadingWidth: 0,
                            leading: Padding(
                              padding: EdgeInsets.only(top: 0.5.h,left: 1.w),
                              child: SvgPicture.asset(
                                  "assets/images/Lead Icon.svg",),
                            ),
                            title: TextWidget(text: "Invite friends",
                                size: 12.sp,
                                bold: FontWeight.w500,
                                color: primaryTextColor),
                            trailing: Icon(
                              Icons.arrow_forward_ios_outlined, size: 1.8.h,
                              color: primaryTextColor,)


                        ),
                        ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 0.0),
                            minLeadingWidth: 0,
                            leading: Padding(
                              padding: EdgeInsets.only(top: 0.5.h,left: 3.w),
                              child: SvgPicture.asset(
                                  "assets/images/feedback.svg",height: 1.6.h,),
                            ),
                            title: TextWidget(text: "Send feedback",
                                size: 12.sp,
                                bold: FontWeight.w500,
                                color: primaryTextColor),
                            trailing: Icon(
                              Icons.arrow_forward_ios_outlined, size: 1.8.h,
                              color: primaryTextColor,)


                        ),
                        ListTile(
                            contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
                            minLeadingWidth: 0,
                            leading: Padding(
                              padding: EdgeInsets.only(top: 0.5.h,left: 3.w),
                              child: SvgPicture.asset(
                                  "assets/images/billedin.svg",height: 1.6.h,),
                            ),
                            title: TextWidget(text: "Rate BilledIn",
                                size: 12.sp,
                                bold: FontWeight.w500,
                                color: primaryTextColor),
                            trailing: Icon(
                              Icons.arrow_forward_ios_outlined, size: 1.8.h,
                              color: primaryTextColor,)


                        ),
                      ],
                    )
                ),
                SizedBox(height: 1.8.h,),
                Padding(
                  padding: EdgeInsets.only(left: 4.8.w, right: 4.w),
                  child: TextWidget(text: "Info",
                      size: 11.sp,
                      bold: FontWeight.w500,
                      color: HexColor("#5B5E67")),
                ),
                SizedBox(height: 1.5.h,),
                Container(
                  color: Colors.white,
                  height: 7.h,
                  width: double.maxFinite,
                  padding: EdgeInsets.only(left: 4.w, right: 4.w),
                  child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
                      minLeadingWidth: 0,
                      leading: Padding(
                        padding: EdgeInsets.only(top: 0.5.h,left: 3.w),
                        child: SvgPicture.asset("assets/images/Faq.svg",height: 1.9.h,),
                      ),
                      title: TextWidget(text: "FAQ",
                          size: 12.sp,
                          bold: FontWeight.w500,
                          color: primaryTextColor),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined, size: 1.8.h,
                        color: primaryTextColor,)


                  ),
                ),
                SizedBox(height: 2.5.h,),
                TextWidget(text: "v0.0.0",
                  size: 10.sp,
                  bold: FontWeight.w500,
                  color: primaryTextColor,
                  alignment: TextAlign.center,),
                SizedBox(height: 1.5.h,),
                TextWidget(text: "(c) binvo 2023. All rights reserved",
                  size: 10.sp,
                  bold: FontWeight.w500,
                  color: primaryTextColor,
                  alignment: TextAlign.center,),
                SizedBox(height: 3.h,),
              ],
            )
        );
    }
    );
  }
}
