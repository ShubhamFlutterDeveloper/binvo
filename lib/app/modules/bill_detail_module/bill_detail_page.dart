import 'package:binvo/app/helper_widget/TextField_widget.dart';
import 'package:binvo/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:binvo/app/modules/bill_detail_module/bill_detail_controller.dart';
import 'package:sizer/sizer.dart';
import '../../helper_widget/text_widget.dart';
import '../../string/hexcolor.dart';

class BillDetailPage extends GetView<BillDetailController> {
  final BillDetailController billDetailController = Get.find<BillDetailController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: billDetailController,
        builder: (logic) {
          return Scaffold(
            backgroundColor: Colors.white,
            body:ListView(
              children: [
                SizedBox(height: 4.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: Icon(Icons.arrow_back_ios_rounded,color: HexColor("#5B5E67"),size: 2.6.h),
                      ),
                      SvgPicture.asset("assets/images/trash.svg",height: 2.2.h,)
                    ],
                  ),
                ),
                Divider(thickness: 0.2.w,color: HexColor("#F3F5F9"),),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 1.h),
                      TextWidget(text: 'FOR', size: 10.sp,bold: FontWeight.w500,color: HexColor("#282A38"),),
                      SizedBox(height: 1.h),
                      TextWidget(text: 'Birthday party catering', size: 16.sp, bold: FontWeight.w400,color: HexColor("#282A38")),
                      SizedBox(height: 1.h),
                      GestureDetector(
                        onTap: (){
                          billDetailController.isExpanded = !billDetailController.isExpanded;
                          billDetailController.update();
                        },
                        child: billDetailController.isExpanded == false ? Container(
                          height: 5.h,
                          padding: EdgeInsets.symmetric(horizontal: 2.w),
                          decoration: BoxDecoration(
                              color: HexColor("##F5F5F5"),
                              borderRadius: BorderRadius.circular(0.6.h)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  TextWidget(text: '6.11', size: 11.sp,bold: FontWeight.w400,color: HexColor("#282A38")),
                                  SizedBox(width: 1.w),
                                  SvgPicture.asset("assets/images/dot.svg"),
                                  SizedBox(width: 1.w),
                                  TextWidget(text: '10 Jan 2023', size: 11.sp,bold: FontWeight.w400,color: HexColor("#282A38"),),
                                  SizedBox(width: 1.w),
                                  SvgPicture.asset("assets/images/dot.svg"),
                                  SizedBox(width: 1.w),
                                  TextWidget(text: 'Payable Monthly', size: 11.sp,bold: FontWeight.w400,color: HexColor("#282A38"),),
                                  SizedBox(width: 1.w),
                                  SvgPicture.asset("assets/images/dot.svg"),
                                  SizedBox(width: 1.w),
                                  TextWidget(text: 'R13', size: 11.sp,bold: FontWeight.w400,color: HexColor("#282A38"),),
                                ],
                              ),
                              SvgPicture.asset("assets/images/less.svg")
                            ],
                          ),
                        ) : Container(
                          height: 15.h,
                          padding: EdgeInsets.symmetric(horizontal: 2.w),
                          decoration: BoxDecoration(
                              color: HexColor("##F5F5F5"),
                              borderRadius: BorderRadius.circular(0.6.h)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 1.4.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextWidget(text: 'Reference number: 61.1', size: 11.sp,bold: FontWeight.w400,color: HexColor("#282A38")),
                                  Padding(
                                    padding: EdgeInsets.only(right: 2.w),
                                    child: SvgPicture.asset("assets/images/more.svg"),
                                  )
                                ],
                              ),
                              SizedBox(height: 1.4.h),
                              TextWidget(text: 'Received 10 Jan 2023 12:03', size: 11.sp,bold: FontWeight.w400,color: HexColor("#282A38")),
                              SizedBox(height: 1.4.h),
                              TextWidget(text: 'Payable Monthly', size: 11.sp,bold: FontWeight.w400,color: HexColor("#282A38")),
                              SizedBox(height: 1.4.h),
                              TextWidget(text: 'Repeat 13', size: 11.sp,bold: FontWeight.w400,color: HexColor("#282A38")),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      TextWidget(text: 'PAY TO', size: 9.sp,bold: FontWeight.w600,color: HexColor("#282A38"),),
                      SizedBox(height: 1.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RotatedBox(
                            quarterTurns: 1,
                            child: Container(
                              height: 4.4.h,
                              width: 11.w,
                              margin: EdgeInsets.only(right: 1.6.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.h),
                                  image: DecorationImage(image: AssetImage("assets/images/Image layer.png"),fit: BoxFit.cover)
                              ),
                            ),
                          ),
                          SizedBox(width: 2.w),
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                  text: "Chap Chap Caterers",
                                  size: 13.sp,
                                  bold: FontWeight.w500,
                                  color: HexColor("#282A38")),
                              SizedBox(
                                height: 0.6.h,
                              ),
                              Container(
                                width: 80.w,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        TextWidget(
                                            text: "KSH 400.00",
                                            size: 12.sp,
                                            bold: FontWeight.w500,
                                            color: HexColor("#5B5E67")),
                                        SizedBox(
                                          width: 1.w,
                                        ),
                                        Container(
                                          height: 0.6.h,
                                          width: 1.w,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(12.w),
                                              color: HexColor("#5B5E67").withOpacity(0.3)),
                                        ),
                                        SizedBox(
                                          width: 1.w,
                                        ),
                                        TextWidget(
                                            text: "Due 29 Jan",
                                            size: 12.sp,
                                            bold: FontWeight.w500,
                                            color: HexColor("#5B5E67")),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextWidget(text: 'VAT',
                                          size: 11.sp,bold: FontWeight.w500,color: HexColor("#282A38"),),
                                        SizedBox(width: 0.5.w,),
                                        SvgPicture.asset('assets/images/info.svg'),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 0.6.h,
                              ),
                              TextWidget(
                                  text: "In 2 days",
                                  size: 13.sp,
                                  bold: FontWeight.w500,
                                  color: HexColor("#777A85")),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 4.h),
                      TextWidget(text: 'October 2022, 20 full course meals, plus the', size: 12.sp,bold: FontWeight.w400,color: HexColor("#282A38"),),
                      SizedBox(height: 1.h),
                      TextWidget(text: 'takeaway packages', size: 12.sp,bold: FontWeight.w400,color: HexColor("#282A38"),),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          Container(
                            height: 12.h,
                            width: 24.w,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(0.6.h),
                            ),
                          ),
                          SizedBox(width: 6.w),
                          Container(
                            height: 12.h,
                            width: 24.w,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(0.6.h),
                            ),
                          ),
                          SizedBox(width: 6.w),
                          Container(
                            height: 12.h,
                            width: 24.w,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(0.6.h),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height:4.h),
                      TextWidget(text: 'PAYMENT INFO', size: 9.sp,bold: FontWeight.w600,color: HexColor("#282A38"),),
                      SizedBox(height: 2.h,),
                      TextWidget(text: 'Send to Mpesa 0123456789', size: 13.sp,bold: FontWeight.w400,color: HexColor("#5B5E67"),),
                    ],
                  ),
                )
              ],
            ),
            bottomSheet: Container(
                color:HexColor("#F9FAF9"),
                margin: EdgeInsets.only(bottom: 4.h),
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset("assets/images/addImage.svg"),
                    Expanded(child:
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical: 1.4.h,horizontal: 4.w),

                      child: TextFieldWidget(
                        minLines: 1,
                        style: TextStyle(fontSize: 11.5.sp,color: primaryTextColor),
                        maxLines: 6,
                       textInputType: TextInputType.multiline,
                        hintText: "Receipt or ref no.",
                        controller: billDetailController.referenceController,
                        fillColor: Colors.white,
                        hintStyle: TextStyle(color: HexColor("#777A85"),fontSize: 11.sp),),
                    )),
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/correct.svg"),
                        SizedBox(width: 1.w),
                        TextWidget(text: 'Cleared', size: 11.sp,bold: FontWeight.w500,color: HexColor("#5141BF"),),
                      ],
                    ),
                  ],
                )
            ),
          );
        });
  }
}
