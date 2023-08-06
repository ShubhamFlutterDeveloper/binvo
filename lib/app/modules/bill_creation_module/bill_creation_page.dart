import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:binvo/app/modules/bill_creation_module/bill_creation_controller.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../api_collection/dio_api_method.dart';
import '../../helper_widget/text_widget.dart';
import '../../routes/app_pages.dart';
import '../../string/hexcolor.dart';
import '../../theme/app_colors.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class BillCreationPage extends GetView<BillCreationController> {
  final billCreationController = Get.find<BillCreationController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: billCreationController,
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
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      color: Colors.white,
                      height: 4.h,
                      width: double.maxFinite,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SafeArea(
                                        child: Wrap(
                                          children: <Widget>[
                                            ListTile(
                                                tileColor: Colors.white,
                                                title: TextWidget(text: "Discard bill?", size: 12.sp, bold: FontWeight.w600,alignment: TextAlign.center,color: primaryTextColor,),
                                                onTap: () {}),
                                            Divider(
                                              height: 0.1.h,
                                              thickness: 0.2.w,
                                              color: HexColor("#F3F5F9"),
                                            ),
                                            ListTile(
                                              tileColor: Colors.white,
                                              title: TextWidget(text: "Discard", size: 12.sp, bold: FontWeight.w600,alignment: TextAlign.center,color: HexColor("#CC4254"),),
                                              onTap: () {
                                                Get.offAllNamed(Routes.HOME_SCREEN);
                                              },
                                            ),
                                            Divider(
                                              height: 0.1.h,
                                              thickness: 0.2.w,
                                              color: HexColor("#F3F5F9"),
                                            ),
                                            ListTile(
                                              tileColor: Colors.white,
                                              title: TextWidget(text: "Keep editing", size: 12.sp, bold: FontWeight.w600,alignment: TextAlign.center,color: HexColor("#5141BF"),),
                                              onTap: () {
                                                Get.back();

                                              },
                                            ),
                                            SizedBox(height: 4.h,),
                                            Center(
                                              child: Container(
                                                height: 1.2.h,
                                                width: 50.w,
                                                decoration: BoxDecoration(
                                                    color: primaryTextColor,
                                                    borderRadius: BorderRadius.circular(4.w)
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 2.h,)
                                          ],
                                        ),
                                      );
                                    });
                              },
                              child:
                                  SvgPicture.asset('assets/images/close.svg')),
                          TextWidget(
                            text: "New Bill",
                            size: 12.sp,
                            bold: FontWeight.w500,
                            color: primaryTextColor,
                            alignment: TextAlign.center,
                          ),
                          billCreationController.isLoading==false?
                          GestureDetector(
                            onTap: () {
                              if(billCreationController.imageFileList?.isEmpty==true)
                             { billCreationController.isLoading = true;
                             billCreationController.editBillApi();
                             billCreationController.update();}
                              else{
                                billCreationController.uploadProfileImage();
                              }
                              },
                            child: TextWidget(
                              text: "Save",
                              size: 12.sp,
                              bold: FontWeight.w600,
                              color: billCreationController.titleController.text.isNotEmpty?HexColor("#5141BF"):HexColor("#B4B5BD"),
                              alignment: TextAlign.center,
                            ),
                          ):CircularProgressIndicator(color: primaryTextColor,),
                        ],
                      )),
                  SizedBox(
                    height: 0.7.h,
                  ),
                  Divider(
                    thickness: 0.2.w,
                    color: HexColor("#F3F5F9"),
                  ),
                  SizedBox(
                    height: 1.0.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: TextField(
                      cursorColor: primaryTextColor,
                      controller: billCreationController.titleController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        border: InputBorder.none,
                        hintText: 'Title e.g. rent',
                        hintStyle: TextStyle(
                          color: Color(0xff777A85),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(
                          text: "KSH",
                          size: 12.sp,
                          bold: FontWeight.w600,
                          color: HexColor("#282A38"),
                        ),
                        SizedBox(
                          width: 1.5.w,
                        ),
                        Expanded(
                          child: TextField(
                            controller:
                                billCreationController.currencyControlller,
                            cursorColor: primaryTextColor,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '0.00',
                              hintStyle: TextStyle(
                                color: Color(0xff777A85),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.6.h,
                  ),
                  Container(
                    height: 6.5.h,
                    width: double.maxFinite,
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: HexColor("#777A85") // Border color
                              ),
                      borderRadius: BorderRadius.circular(4.0), // Border radius
                    ),
                    child: Center(
                      child: ListTile(
                        onTap: () {
                          billCreationController.showAlertDialog(context);
                        },
                        dense: false,
                        minLeadingWidth: 0,
                        horizontalTitleGap: 0,
                        contentPadding: EdgeInsets.zero,
                        leading: TextWidget(
                          text: "Payable",
                          size: 12.sp,
                          bold: FontWeight.w400,
                          color: primaryTextColor,
                          alignment: TextAlign.center,
                        ),
                        trailing: GestureDetector(
                          onTap: () {},
                          child: TextWidget(
                            text: billCreationController.selectedItems.isNotEmpty
                                ? billCreationController.selectedItems.join("")
                                : "Once",
                            size: 12.sp,
                            bold: FontWeight.w400,
                            color: primaryTextColor,
                            alignment: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Container(
                    height: 6.5.h,
                    width: double.maxFinite,
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: HexColor("#777A85") // Border color
                              ),
                      borderRadius: BorderRadius.circular(4.0), // Border radius
                    ),
                    child: Center(
                      child: ListTile(
                        dense: false,
                        minLeadingWidth: 0,
                        horizontalTitleGap: 0,
                        contentPadding: EdgeInsets.zero,
                        leading: TextWidget(
                          text: "Due",
                          size: 12.sp,
                          bold: FontWeight.w400,
                          color: primaryTextColor,
                          alignment: TextAlign.center,
                        ),
                        trailing: Obx(() => GestureDetector(
                              onTap: () {
                                billCreationController.showDatePickerDialog(context);
                              },
                              child: TextWidget(
                                text: DateFormat('d MMM yyyy').format(
                                    billCreationController.selectedDate.value),
                                size: 12.sp,
                                bold: FontWeight.w400,
                                color: primaryTextColor,
                                alignment: TextAlign.center,
                              ),
                            )), // Trailing icon
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  billCreationController.selectedItems.isNotEmpty
                      ? Container(
                          height: 6.5.h,
                          width: double.maxFinite,
                          margin: EdgeInsets.symmetric(horizontal: 4.w),
                          padding: EdgeInsets.symmetric(horizontal: 2.w),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: HexColor("#777A85") // Border color
                                ),
                            borderRadius:
                                BorderRadius.circular(4.0), // Border radius
                          ),
                          child: Center(
                            child: ListTile(
                              onTap: () {
                                endsModalSheet(context);
                              },
                              dense: false,
                              minLeadingWidth: 0,
                              horizontalTitleGap: 0,
                              contentPadding: EdgeInsets.zero,
                              leading: TextWidget(
                                text: "Ends",
                                size: 12.sp,
                                bold: FontWeight.w400,
                                color: primaryTextColor,
                                alignment: TextAlign.center,
                              ),
                              trailing: TextWidget(
                                text: billCreationController.selectEndsOption??"Never",
                                size: 12.sp,
                                bold: FontWeight.w400,
                                color: primaryTextColor,
                                alignment: TextAlign.center,
                              ),
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: TextField(
                      controller: billCreationController.notesControlller,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Add note',
                        labelStyle: TextStyle(
                          color: HexColor("#777A85"),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      billCreationController.showPicker(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 80.w),
                      child: SvgPicture.asset('assets/images/Photo card.svg'),
                    ),
                  ),
                  SizedBox(
                    height: 2.w,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    height: 14.h,
                    child: ListView.builder(
                        itemCount: billCreationController.imageFileList?.length ?? 0,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) {
                          return GestureDetector(
                            onTap: () {
                              // billCreationController.onTapIndex = i;
                              // billCreationController.update();
                            },
                            child: Container(
                              width: 28.w,
                              margin: EdgeInsets.only(right: 3.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  image: FileImage(File(billCreationController.imageFileList![i].path)),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ));
        });
  }

  void endsModalSheet(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(2.h), topLeft: Radius.circular(2.h))),
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (context, setState) => DraggableScrollableSheet(
                    expand: false,
                    initialChildSize: 0.94,
                    builder: (context, myScrollController) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 4.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 45.w),
                                child: TextWidget(
                                  text: "Ends",
                                  size: 12.sp,
                                  bold: FontWeight.w600,
                                  color: primaryTextColor,
                                  alignment: TextAlign.center,
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  billCreationController.update();
                                  Get.back();
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(right: 4.w),
                                  child: TextWidget(
                                    text: "Done",
                                    size: 12.sp,
                                    bold: FontWeight.w600,
                                    color: HexColor("#5141BF"),
                                    alignment: TextAlign.end,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Divider(
                            thickness: 0.2.w,
                            color: HexColor("#F3F5F9"),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          RadioListTile(
                            activeColor: primaryTextColor,
                            title: TextWidget(
                              text: "Never",
                              size: 12.sp,
                              bold: FontWeight.w600,
                              color: primaryTextColor,
                            ),
                            value: 'Never',
                            groupValue: billCreationController.selectEndsOption,
                            onChanged: (value) {
                              setState(() {
                                billCreationController.selectEndsOption = value;
                              });
                            },
                          ),
                          RadioListTile(
                            activeColor: primaryTextColor,
                            title: Row(
                              children: [
                                TextWidget(
                                  text: "After",
                                  size: 12.sp,
                                  bold: FontWeight.w600,
                                  color: primaryTextColor,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: TextField(
                                      controller: billCreationController
                                          .repeatController,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 4.w),
                                        border: InputBorder.none,
                                        hintText: '10',
                                        hintStyle: TextStyle(
                                          color: primaryTextColor,
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                TextWidget(
                                  text: "Repeats",
                                  size: 12.sp,
                                  bold: FontWeight.w400,
                                  color: primaryTextColor,
                                ),
                                SizedBox(
                                  width: 30.w,
                                ),
                              ],
                            ),
                            value: 'After ${billCreationController.repeatController.text} repeats',
                            groupValue: billCreationController.selectEndsOption,
                            onChanged: (value) {
                              setState(() {
                                billCreationController.selectEndsOption = value;
                              });
                            },
                          ),
                        ],
                      );
                    },
                  ));
        });
  }
}
