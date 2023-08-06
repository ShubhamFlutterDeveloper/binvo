import 'package:binvo/app/modules/upgrade_plan_screen_module/upgrade_plan_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../helper_widget/text_widget.dart';
import '../../string/hexcolor.dart';

class UpgradePlanScreenPage extends GetView<UpgradePlanScreenController> {
  final UpgradePlanScreenController upgradePlanScreenController = Get.find<UpgradePlanScreenController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: upgradePlanScreenController,
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: HexColor('#FFFFFF'),
            leading: GestureDetector(
                onTap: (){
                  Get.back();
                },
                child: Icon(Icons.arrow_back_ios, color: HexColor("#5B5E67"), size: 2.6.h)),
            title:TextWidget(text: "Upgrade",
                size: 12.sp,
                bold: FontWeight.w600,
                color: HexColor("282A38")),
            actions: [
              GestureDetector(
                onTap: (){},
                child: Container(
                  padding: EdgeInsets.all(2.8.h),
                  child: TextWidget(text: "Restore",
                      size: 13.sp,
                      bold: FontWeight.w400,
                      color: Color(0xff5141BF)),
                ),
              )
            ],
            centerTitle: true,
            toolbarHeight: 8.h,

          ),
          body: Container(
            width: double.infinity,
            color: Color(0xffF5F5F5),
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
              children: [
                Container(
                  color: Colors.white,
                  height: 22.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 2.h),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0.6.h),
                            color: Color(0xffF3F5F9),
                          ),
                          width: 30.w,
                          height: 3.h,
                          alignment: Alignment.center,
                          child: TextWidget(text: "CURRENT PLAN",
                              size: 9.sp,
                              bold: FontWeight.w500,
                              color: Color(0xff5B5E67))
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Padding(
                        padding: EdgeInsets.only(left: 9.w),
                        child: TextWidget(text: "Free",
                            size: 16.sp,
                            bold: FontWeight.w700,
                            color: Color(0xff282A38)),
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        children: [
                          SizedBox(width: 4.w),
                          Icon(Icons.check, color: HexColor("#5B5E67"), size: 1.6.h),
                          SizedBox(width: 2.w),
                          TextWidget(text: "Add upto 5 bills",
                              size: 11.sp,
                              bold: FontWeight.w400,
                              color: Color(0xff282A38))
                        ],
                      ),
                      SizedBox(height: 1.h),
                      Row(
                        children: [
                          SizedBox(width: 4.w),
                          Icon(Icons.check, color: HexColor("#5B5E67"), size: 1.6.h),
                          SizedBox(width: 2.w),
                          TextWidget(text: "Receive unlimited bills",
                              size: 11.sp,
                              bold: FontWeight.w400,
                              color: Color(0xff282A38))
                        ],
                      ),
                      SizedBox(height: 1.h),
                      Row(
                        children: [
                          SizedBox(width: 4.w),
                          Icon(Icons.check, color: HexColor("#5B5E67"), size: 1.6.h),
                          SizedBox(width: 2.w),
                          TextWidget(text: "Send upto 5 invoices",
                              size: 11.sp,
                              bold: FontWeight.w400,
                              color: Color(0xff282A38))
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 1.h),
                Container(
                  color: Colors.white,
                  height: 36.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 2.h),
                      Center(
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0.6.h),
                              color: Color(0xffD2D4D9),
                            ),
                            width: 30.w,
                            height: 3.h,
                            alignment: Alignment.center,
                            child: TextWidget(text: "BEST SELLER",
                                size: 9.sp,
                                bold: FontWeight.w500,
                                color: Color(0xff5B5E67))
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Padding(
                        padding: EdgeInsets.only(left: 9.w),
                        child: TextWidget(text: "Pro",
                            size: 16.sp,
                            bold: FontWeight.w700,
                            color: Color(0xff282A38)),
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        children: [
                          SizedBox(width: 4.w),
                          Icon(Icons.check, color: HexColor("#5B5E67"), size: 1.6.h),
                          SizedBox(width: 2.w),
                          TextWidget(text: "Add unlimited bills",
                              size: 11.sp,
                              bold: FontWeight.w400,
                              color: Color(0xff282A38))
                        ],
                      ),
                      SizedBox(height: 1.h),
                      Row(
                        children: [
                          SizedBox(width: 4.w),
                          Icon(Icons.check, color: HexColor("#5B5E67"), size: 1.6.h),
                          SizedBox(width: 2.w),
                          TextWidget(text: "Receive unlimited bills",
                              size: 11.sp,
                              bold: FontWeight.w400,
                              color: Color(0xff282A38))
                        ],
                      ),
                      SizedBox(height: 1.h),
                      Row(
                        children: [
                          SizedBox(width: 4.w),
                          Icon(Icons.check, color: HexColor("#5B5E67"), size: 1.6.h),
                          SizedBox(width: 2.w),
                          TextWidget(text: "Send upto 50 invoices",
                              size: 11.sp,
                              bold: FontWeight.w400,
                              color: Color(0xff282A38))
                        ],
                      ),
                      SizedBox(height: 2.h),
                      upgradePlanScreenController.isPlanPurchased == true
                          ? Center(
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 1.h),
                              child: TextWidget(text: "Next payment: 15 Feb 2024",
                              size: 11.sp,
                              bold: FontWeight.w400,
                              color: HexColor("#2965C5")),
                            ),
                          )
                          : SizedBox.shrink(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(text: "KSH ",
                              size: 10.sp,
                              bold: FontWeight.w400,
                              color: Color(0xff282A38)),
                          TextWidget(text: "999",
                              size: 16.sp,
                              bold: FontWeight.w700,
                              color: Color(0xff282A38)),
                          TextWidget(text: " / Year",
                              size: 10.sp,
                              bold: FontWeight.w400,
                              color: Color(0xff282A38)),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      upgradePlanScreenController.isPlanPurchased == true
                          ? GestureDetector(
                        onTap: (){
                        },
                        child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 4.w),
                            height: 6.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: Colors.black.withOpacity(0.06), width: 0.6)
                            ),
                            alignment: Alignment.center,
                            child: TextWidget(text: "Cancel subscription",
                                size: 12.sp,
                                bold: FontWeight.w400,
                                color: HexColor("#5B5E67"))
                        ),
                      )
                          : GestureDetector(
                        onTap: (){
                          upgradePlanScreenController.isPlanPurchased = true;
                          upgradePlanScreenController.update();
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 4.w),
                          height: 6.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Color(0xff5141BF),
                          ),
                          alignment: Alignment.center,
                          child: TextWidget(text: "Start 1 month free trial",
                              size: 12.sp,
                              bold: FontWeight.w400,
                              color: Color(0xffF9FAF9))
                        ),
                      ),
                      SizedBox(height: 1.h),
                      upgradePlanScreenController.isPlanPurchased == true ? SizedBox.shrink() : Center(
                        child: TextWidget(text: "Renewed yearly, cancel anytime",
                            size: 10.sp,
                            bold: FontWeight.w400,
                            color: Color(0xff5B5E67))
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 1.h),
                Container(
                  color: Colors.white,
                  height: 32.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 2.h),
                      Padding(
                        padding: EdgeInsets.only(left: 9.w),
                        child: TextWidget(text: "Bizz",
                            size: 16.sp,
                            bold: FontWeight.w700,
                            color: Color(0xff282A38)),
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        children: [
                          SizedBox(width: 4.w),
                          Icon(Icons.check, color: HexColor("#5B5E67"), size: 1.6.h),
                          SizedBox(width: 2.w),
                          TextWidget(text: "Add unlimited bills",
                              size: 11.sp,
                              bold: FontWeight.w400,
                              color: Color(0xff282A38))
                        ],
                      ),
                      SizedBox(height: 1.h),
                      Row(
                        children: [
                          SizedBox(width: 4.w),
                          Icon(Icons.check, color: HexColor("#5B5E67"), size: 1.6.h),
                          SizedBox(width: 2.w),
                          TextWidget(text: "Receive unlimited bills",
                              size: 11.sp,
                              bold: FontWeight.w400,
                              color: Color(0xff282A38))
                        ],
                      ),
                      SizedBox(height: 1.h),
                      Row(
                        children: [
                          SizedBox(width: 4.w),
                          Icon(Icons.check, color: HexColor("#5B5E67"), size: 1.6.h),
                          SizedBox(width: 2.w),
                          TextWidget(text: "Send upto 500 invoices",
                              size: 11.sp,
                              bold: FontWeight.w400,
                              color: Color(0xff282A38))
                        ],
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(text: "KSH ",
                              size: 10.sp,
                              bold: FontWeight.w400,
                              color: Color(0xff282A38)),
                          TextWidget(text: "6999",
                              size: 16.sp,
                              bold: FontWeight.w700,
                              color: Color(0xff282A38)),
                          TextWidget(text: " / Year",
                              size: 10.sp,
                              bold: FontWeight.w400,
                              color: Color(0xff282A38)),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      GestureDetector(
                        onTap: (){
                          bottomSheet(context);
                        },
                        child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 4.w),
                            height: 6.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Color(0xff5141BF),
                            ),
                            alignment: Alignment.center,
                            child: TextWidget(text: upgradePlanScreenController.isPlanPurchased == true ? "Upgrade to Bizz" : "Start 1 month free trial",
                                size: 12.sp,
                                bold: FontWeight.w400,
                                color: Color(0xffF9FAF9))
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Center(
                          child: TextWidget(text: "Renewed yearly, cancel anytime",
                              size: 10.sp,
                              bold: FontWeight.w400,
                              color: Color(0xff5B5E67))
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  bottomSheet(context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context, builder: (builder) {
      return SingleChildScrollView(
        child: AnimatedPadding(
          duration: const Duration(milliseconds: 100),
          curve: Curves.decelerate,
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            height: 40.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(3.w),
                    topLeft: Radius.circular(3.w)),
              ),
            child: Column(
              children: [
                SizedBox(height: 4.h),
                SvgPicture.asset("assets/images/star.svg"),
                SizedBox(height: 1.h),
                TextWidget(text: "Upgrade",
                    size: 16.sp,
                    bold: FontWeight.w700,
                    color: Color(0xff282A38)),
                SizedBox(height: 4.h),
                TextWidget(text: "Upgrade to Pro or Bizz plan to get the",
                    size: 14.sp,
                    bold: FontWeight.w400,
                    color: Color(0xff282A38)),
                SizedBox(height: 0.6.h),
                TextWidget(text: "most out of Binvo",
                    size: 14.sp,
                    bold: FontWeight.w400,
                    color: Color(0xff282A38)),
                SizedBox(height: 4.h),
                GestureDetector(
                  onTap: (){
                  },
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.w),
                      height: 6.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Color(0xff5141BF),
                      ),
                      alignment: Alignment.center,
                      child: TextWidget(text: "Upgrade options",
                          size: 12.sp,
                          bold: FontWeight.w400,
                          color: Color(0xffF9FAF9))
                  ),
                ),
                SizedBox(height: 4.h),
                GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                  child: TextWidget(text: "Not now",
                      size: 12.sp,
                      bold: FontWeight.w400,
                      color: HexColor("#777A85")),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}