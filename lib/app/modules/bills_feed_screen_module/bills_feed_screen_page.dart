  import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sizer/sizer.dart';

import '../../helper_widget/text_widget.dart';
import '../../routes/app_pages.dart';
import '../../string/hexcolor.dart';
import '../../theme/app_colors.dart';
import 'package:binvo/app/modules/bills_feed_screen_module/bills_feed_screen_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class BillsFeedScreenPage extends GetView<BillsFeedScreenController> {
  final BillsFeedScreenController billsFeedScreenController =
  Get.put<BillsFeedScreenController>(BillsFeedScreenController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: billsFeedScreenController,
        builder: (_) {
          return

            Scaffold(
                backgroundColor: HexColor("#FFFFFF"),
                body: ListView(
                  children: [
                    Container(height: 4.h, width: double.maxFinite,color: Colors.white,),
                    Container(
                        padding: EdgeInsets.only(left: 4.w,right: 4.w),
                        color: Colors.white,
                        height:  billsFeedScreenController.getBillResponse.body?.isEmpty==true?5.h:15.h,
                        width: double.maxFinite,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        billsFeedScreenController.goToPreviousMonth();
                                      },
                                      child: Icon(
                                        Icons.arrow_back_ios_new,
                                        color: HexColor("#5B5E67"),
                                        size: 2.5.h,
                                      ),
                                    ),
                                    SizedBox(width: 2.5.w),
                                    Obx(() => GestureDetector(
                                      onTap: () {
                                        billsFeedScreenController.showDateSuggestions();
                                      },
                                      child: TextWidget(
                                        text: DateFormat('MMM yyyy').format(
                                            billsFeedScreenController.selectedMonth.value),
                                        size: 12.sp,
                                        bold: FontWeight.w600,
                                        color: primaryTextColor,
                                      ),
                                    )),
                                    SizedBox(width: 2.5.w),
                                    GestureDetector(
                                      onTap: () {
                                        billsFeedScreenController.goToNextMonth();
                                      },
                                      child: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: HexColor("#5B5E67"),
                                        size: 2.5.h,
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                    onTap: (){
                                      Get.toNamed(Routes.BILL_CREATION);
                                    },
                                    child: Icon(Icons.add,color: HexColor("#5B5E67"),size: 3.5.h,))
                              ],
                            ),
                            billsFeedScreenController.getBillResponse.body?.isEmpty==true?
                           SizedBox.shrink(): SizedBox(height: 2.h,),
                            billsFeedScreenController.getBillResponse.body?.isEmpty==true?
                           SizedBox.shrink(): Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextWidget(text:"${billsFeedScreenController.getBillResponse.body?.length} Invoices", size: 12.sp,bold: FontWeight.w600,color: HexColor("#5B5E67"),),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        CircularPercentIndicator(
                                          radius: 1.6.h,
                                          animation: true,
                                          animationDuration: 1200,
                                          lineWidth:4.0,
                                          percent: 0.4,
                                          circularStrokeCap: CircularStrokeCap.butt,
                                          backgroundColor: HexColor("#D7D3F0"),
                                          progressColor: HexColor("#382D84"),
                                        ),
                                        SizedBox(width: 2.w,),
                                        TextWidget(text:"KSH 16k", size: 12.sp,bold: FontWeight.w600,color: HexColor("#5B5E67"),),

                                      ],
                                    ),

                                  ],
                                )
                              ],
                            ),
                            billsFeedScreenController.getBillResponse.body?.isEmpty==true?
                           SizedBox.shrink(): SizedBox(height: 2.h,),
                            billsFeedScreenController.getBillResponse.body?.isEmpty==true?
                          SizedBox.shrink():  Container(
                              padding: EdgeInsets.only(top: 0.6.h),
                              height: 4.h,
                              decoration: BoxDecoration(
                                  color: HexColor("#F3F5F9"),
                                  borderRadius: BorderRadius.circular(0.8.w)
                              ),
                              child:  TextWidget(text:" 1 Receipts received ", size: 12.sp,bold: FontWeight.w600,color: HexColor("#5B5E67"),),

                            )

                          ],
                        )

                    ),
                    Divider(thickness: 0.2.w,color: HexColor("#F3F5F9"),),
                    SizedBox(height: 0.5.h,),
                    billsFeedScreenController.getBillResponse.body?.isEmpty==true?
                        Column(
                          children: [
                            SizedBox(height: 10.h,),
                            Center(child: SvgPicture.asset("assets/images/Icon.svg")),
                            SizedBox(height:2.h,),
                            TextWidget(
                              text: "No bills due this month",
                              size: 12.sp,
                              bold: FontWeight.w600,
                              color: HexColor("#777A85"),
                            ),
                            SizedBox(height:2.h,),
                            TextWidget(
                              text: "Bills you add or receive from others will\nappear here",
                              size: 12.sp,
                              bold: FontWeight.w600,
                              color: HexColor("#777A85"),
                              alignment: TextAlign.center,
                            ),
                          ],
                        ):
                    billsFeedScreenController.getBillResponse.body==null?
                        Center(
                          child: CircularProgressIndicator(color: primaryTextColor,),
                        ):
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: billsFeedScreenController.getBillResponse.body?.length??0,
                      itemBuilder: (context, index) {
                        String startDate = billsFeedScreenController.getBillResponse.body?[index].billId?.startDate ?? '';
                        String formattedStartDate = billsFeedScreenController.formatDateTime(startDate);
                        return Dismissible(
                            key: Key(index.toString()),
                            background:  ColoredBox(
                              color: HexColor("#CC4254"),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: EdgeInsets.all(5.h),
                                  child:SvgPicture.asset("assets/images/delete.svg"),
                                ),
                              ),
                            ),
                            direction: DismissDirection.endToStart,
                            onDismissed: (direction) {
                              billsFeedScreenController.update();
                              // Scaffold.of(context).showSnackBar(SnackBar(content: Text("dismissed")));
                            },
                            child:  Padding(
                              padding:EdgeInsets.only(left: 2.w,right: 2.w),
                              child: Column(
                                children: [
                                  ListTile(
                                    onTap: (){Get.toNamed(Routes.BILL_DETAIL);},
                                    contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
                                    minLeadingWidth: 0,
                                    minVerticalPadding: 0,
                                    dense: false,
                                    leading:
                                    RotatedBox(
                                      quarterTurns: 1,
                                      child: ClipOval(
                                          child: Container(
                                            padding: EdgeInsets.symmetric(horizontal: 2.2.h),
                                            height: 6.h,
                                            width: 25.w,

                                            decoration: BoxDecoration(
                                                color: HexColor("#F3F5F9"),
                                              image: DecorationImage(image: AssetImage("assets/images/Image layer.png"),fit: BoxFit.fill)
                                            ),

                                          )
                                      ),
                                    ),
                                    title:Padding(
                                      padding:  EdgeInsets.only(bottom: 0.6.h),
                                      child: TextWidget(text:billsFeedScreenController.getBillResponse.body?[index].billId?.title??"", size: 12.6.sp,bold: FontWeight.w600,color: HexColor("#5B5E67")),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        TextWidget(text:billsFeedScreenController.getBillResponse.body?[index].billId?.billNotes??"Note not added", size: 12.sp,bold: FontWeight.w500  ,color: HexColor("#5B5E67")),
                                        SizedBox(height: 0.5.h,),
                                        Row(
                                          children: [
                                            TextWidget(text:formattedStartDate, size: 12.sp,bold: FontWeight.w500  ,color: HexColor("#2965C5")),
                                            SizedBox(width: 2.w,),
                                            Container(
                                              height: 0.7.h,
                                              width: 1.5.w,
                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.w),color: HexColor("#5B5E67")),),
                                            SizedBox(width: 2.w,),
                                            TextWidget(text:"KSH ${billsFeedScreenController.getBillResponse.body?[index].billId?.price?.numberDecimal.toString()??"00.00"}", size: 12.sp,bold: FontWeight.w500  ,color: HexColor("#5B5E67")),
]
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 4.h,)
                                ],
                              ),
                            )
                        );




                      },)
                  ],
                )
            );}
    );
  }
}
