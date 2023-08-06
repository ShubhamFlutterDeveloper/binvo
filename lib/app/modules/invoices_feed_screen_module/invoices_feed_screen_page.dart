import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:binvo/app/modules/invoices_feed_screen_module/invoices_feed_screen_controller.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sizer/sizer.dart';
import '../../helper_widget/text_widget.dart';
import '../../routes/app_pages.dart';
import '../../string/hexcolor.dart';
import '../../theme/app_colors.dart';

class InvoicesFeedScreenPage extends GetView<InvoicesFeedScreenController> {
  final InvoicesFeedScreenController invoicesFeedScreenController =
      Get.put<InvoicesFeedScreenController>(InvoicesFeedScreenController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: invoicesFeedScreenController,
        builder: (_) {
          return Scaffold(
              backgroundColor: HexColor("#FFFFFF"),
              body: ListView(
                children: [
                  Container(
                    height: 4.h,
                    width: double.maxFinite,
                    color: Colors.white,
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 4.w, right: 4.w),
                      color: Colors.white,
                      height: 15.h,
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
                                        invoicesFeedScreenController
                                            .goToPreviousMonth();
                                      },
                                      child: Icon(
                                        Icons.arrow_back_ios_new,
                                        color: HexColor("#5B5E67"),
                                        size: 2.5.h,
                                      )),
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        invoicesFeedScreenController
                                            .showDateSuggestions();
                                      },
                                      child: TextWidget(
                                        text: DateFormat('MMM yyyy').format(
                                            controller.selectedMonth.value),
                                        size: 12.sp,
                                        bold: FontWeight.w600,
                                        color: primaryTextColor,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        invoicesFeedScreenController
                                            .goToNextMonth();
                                      },
                                      child: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: HexColor("#5B5E67"),
                                        size: 2.5.h,
                                      )),
                                ],
                              ),
                              GestureDetector(
                                  onTap: () {
                                 invoicesFeedScreenController.showContactBottomSheet(context);
                                 //invoicesFeedScreenController.update();
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: HexColor("#5B5E67"),
                                    size: 3.5.h,
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextWidget(
                                text: "3 Invoices",
                                size: 12.sp,
                                bold: FontWeight.w600,
                                color: HexColor("#5B5E67"),
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      CircularPercentIndicator(
                                        radius: 1.6.h,
                                        animation: true,
                                        animationDuration: 1200,
                                        lineWidth: 4.0,
                                        percent: 0.4,
                                        circularStrokeCap:
                                            CircularStrokeCap.butt,
                                        backgroundColor: HexColor("#D7D3F0"),
                                        progressColor: HexColor("#382D84"),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      TextWidget(
                                        text: "KSH 16k",
                                        size: 12.sp,
                                        bold: FontWeight.w600,
                                        color: HexColor("#5B5E67"),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 0.6.h),
                            height: 4.h,
                            decoration: BoxDecoration(
                                color: HexColor("#F3F5F9"),
                                borderRadius: BorderRadius.circular(0.8.w)),
                            child: TextWidget(
                              text: " 1 Receipts received ",
                              size: 12.sp,
                              bold: FontWeight.w600,
                              color: HexColor("#5B5E67"),
                            ),
                          )
                        ],
                      )),
                  Divider(
                    thickness: 0.2.w,
                    color: HexColor("#F3F5F9"),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          Get.toNamed(Routes.INVOICE_DETAIL);
                        },
                        child: Dismissible(
                            key: Key(index.toString()),
                            background: ColoredBox(
                              color: HexColor("#CC4254"),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: EdgeInsets.all(5.h),
                                  child: SvgPicture.asset(
                                      "assets/images/delete.svg"),
                                ),
                              ),
                            ),
                            direction: DismissDirection.endToStart,
                            onDismissed: (direction) {
                              invoicesFeedScreenController.update();
                              // Scaffold.of(context).showSnackBar(SnackBar(content: Text("dismissed")));
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: 2.w, right: 2.w),
                              child: Column(
                                children: [
                                  ListTile(
                                    contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
                                    minLeadingWidth: 0,
                                    minVerticalPadding: 0,
                                    dense: false,
                                    leading: RotatedBox(
                                      quarterTurns: 1,
                                      child: ClipOval(
                                          child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 2.2.h),
                                        height: 6.h,
                                        width: 25.w,
                                        color: HexColor("#F3F5F9"),
                                        child: RotatedBox(
                                            quarterTurns: -1,
                                            child: TextWidget(
                                              text: "M",
                                              size: 12.sp,
                                              bold: FontWeight.w600,
                                              color: HexColor("#5B5E67"),
                                              alignment: TextAlign.center,
                                            )),
                                      )),
                                    ),
                                    title: Padding(
                                      padding: EdgeInsets.only(bottom: 0.6.h),
                                      child: TextWidget(
                                          text: "50 head prewedding catering",
                                          size: 12.6.sp,
                                          bold: FontWeight.w600,
                                          color: HexColor("#5B5E67")),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextWidget(
                                            text: "Mary Catherine",
                                            size: 12.sp,
                                            bold: FontWeight.w500,
                                            color: HexColor("#5B5E67")),
                                        SizedBox(
                                          height: 0.5.h,
                                        ),
                                        Row(
                                          children: [
                                            TextWidget(
                                                text: "29 Jan",
                                                size: 12.sp,
                                                bold: FontWeight.w500,
                                                color: HexColor("#5B5E67")),
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            Container(
                                              height: 0.7.h,
                                              width: 1.5.w,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20.w),
                                                  color: HexColor("#5B5E67")),
                                            ),
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            TextWidget(
                                                text: "KSH 12,000.00",
                                                size: 12.sp,
                                                bold: FontWeight.w500,
                                                color: HexColor("#5B5E67")),
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            Container(
                                              height: 0.7.h,
                                              width: 1.5.w,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20.w),
                                                  color: HexColor("#5B5E67")),
                                            ),
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            SvgPicture.asset(
                                              "assets/images/kSH.svg",
                                              height: 1.8.h,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  )
                                ],
                              ),
                            )),
                      );
                    },
                  )
                ],
              ));
        });
  }
}
