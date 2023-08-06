import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:binvo/app/modules/invoice_detail_module/invoice_detail_controller.dart';
import 'package:sizer/sizer.dart';

import '../../helper_widget/text_widget.dart';
import '../../routes/app_pages.dart';
import '../../string/hexcolor.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class InvoiceDetailPage extends GetView<InvoiceDetailController> {
  final InvoiceDetailController invoiceDetailController = Get.find<InvoiceDetailController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: invoiceDetailController,
        builder: (logic) {
          return Scaffold(
            backgroundColor: Colors.white,

            body:ListView(
              children: [
                Container(height: 4.h, width: double.maxFinite,color: Colors.white,),
                Container(
                    padding: EdgeInsets.only(left: 4.w,right: 4.w),
                    color: Colors.white,
                    height: 4.h,
                    width: double.maxFinite,
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Get.back();
                          },
                          child: Padding(
                            padding:  EdgeInsets.only(right: 2.w),
                            child: Icon(Icons.arrow_back_ios_rounded,color: HexColor("#5B5E67"),size: 2.6.h,),
                          ),
                        ),
                        SvgPicture.asset("assets/images/trash.svg",height: 2.2.h,)
                      ],
                    )

                ),
             Padding(
               padding:  EdgeInsets.symmetric(horizontal: 4.w),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Divider(thickness: 0.2.w,color: HexColor("#F3F5F9"),),
                   SizedBox(height: 1.5.h,),
                   TextWidget(text: 'Birthday party catering',
                     size: 16.sp,bold: FontWeight.w400,color: HexColor("#282A38"),),
                   SizedBox(height: 1.h,),
                   ExpansionTile(
                      backgroundColor: HexColor("##F5F5F5"),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.5.w)),
                     trailing: invoiceDetailController.isExpanded
                         ? SvgPicture.asset("assets/images/more.svg")
                         : SvgPicture.asset("assets/images/less.svg"),
                     onExpansionChanged: (bool expanded) {
                         invoiceDetailController.isExpanded = expanded;
                         invoiceDetailController.update();
                     },
                     title: Row(
                       children: [
                         TextWidget(text: '6.11',
                           size: 11.sp,bold: FontWeight.w400,color: HexColor("#282A38"),),
                         SvgPicture.asset("assets/images/dot.svg")
                       ],
                     ),
                     children: <Widget>[
                       Column(
                       //  mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           TextWidget(text: 'Reference number: 61.1',
                             size: 12.sp,bold: FontWeight.w400,color: HexColor("#282A38"),),
                           SvgPicture.asset('assets/images/vector3.svg'),
                         ],
                       ),
                       TextWidget(text: 'Sent 10 Jan 2023 12:03',
                         size: 12.sp,bold: FontWeight.w400,color: HexColor("#282A38"),),
                       TextWidget(text: 'Payable Monthly',
                         size: 12.sp,bold: FontWeight.w400,color: HexColor("#282A38"),),
                       TextWidget(text: 'Repeat 13',
                         size: 12.sp,bold: FontWeight.w400,color: HexColor("#282A38"),),

                     ],
                   ),
                   SizedBox(height: 1.h,),
                   TextWidget(text: 'BILLED TO',
                     size: 9.sp,bold: FontWeight.w600,color: HexColor("#282A38"),),
                   SizedBox(height: 5.2,),
                   ListTile(
                     dense: false,
                     contentPadding: EdgeInsets.zero,
                     leading:RotatedBox(
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

                     title: TextWidget(text: 'John Appleseed',
                       size: 12.sp,bold: FontWeight.w500,color: HexColor("#282A38"),),
                     subtitle: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Row(
                           children: [
                             TextWidget(text: 'KSH 400.00',
                               size: 12.sp,bold: FontWeight.w500,color: HexColor("#282A38"),),
                             SizedBox(width: 0.5.w,),
                             SvgPicture.asset("assets/images/dot.svg"),
                             SizedBox(width: 0.5.w,),
                             TextWidget(text: 'Due 29 Jan',
                               size: 12.sp,bold: FontWeight.w500,color: HexColor("#282A38"),),
                           ],
                         ),
                         TextWidget(text: 'in 2 days',
                           size: 12.sp,bold: FontWeight.w400,color: HexColor("#2965C5"),),
                       ],
                     ),
                     trailing:  Row(
                       mainAxisSize: MainAxisSize.min,
                       children: [
                         TextWidget(text: 'VAT',
                           size: 11.sp,bold: FontWeight.w500,color: HexColor("#282A38"),),
                         SizedBox(width: 0.5.w,),
                         SvgPicture.asset('assets/images/info.svg'),
                       ],
                     ),



                   ),
                   SizedBox(height: 3.5.h,),
                   TextWidget(text: 'October 2022, 20 full course meals, plus the takeaway packages',
                     size: 12.sp,bold: FontWeight.w400,color: HexColor("#282A38"),),
                   SizedBox(height: 2.5.h,),
                   Row(
                     children: [
                       Image.asset('assets/images/photo1.png',height: 78,width: 78,),
                       Padding(padding: EdgeInsets.only(left: 24),),
                       Image.asset('assets/images/photo2.png',height: 78,width: 78,),
                     ],
                   ),
                   SizedBox(height:3.5.h,),
                   TextWidget(text: 'PAYMENT INFO',
                     size: 10.sp,bold: FontWeight.w500,color: HexColor("#282A38"),),
                   SizedBox(height: 3.h,),
                   TextWidget(text: 'Payment info you add to your Profile will appear here for all invoices',
                     size: 10.sp,bold: FontWeight.w400,color: HexColor("#5B5E67"),),
                 ],
               ),
             )
              ],
            ),
            bottomSheet: Container(
                height: 7.h,
              color:HexColor("#F9FAF9"),
              padding: EdgeInsets.symmetric(horizontal: 40),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(text: 'Awaiting receipt',
                    size: 10.sp,bold: FontWeight.w500,color: HexColor("#282A38"),),
                  Row(
                    children: [
                      SvgPicture.asset("assets/images/correct.svg",height: 1.7.h,),
                      SizedBox(width: 1.w,),
                      TextWidget(text: 'Cleared',
                        size: 10.sp,bold: FontWeight.w500,color: HexColor("#5141BF"),),
                    ],
                  ),
                ],
              )


              // Column(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     SvgPicture.asset('assets/images/swipe.svg'),
              //     Text(
              //       'Received receipt',
              //       style: TextStyle(
              //         color: Color(0xff282A38),
              //         fontSize: 14,
              //         fontWeight: FontWeight.w400,
              //       ),
              //     ),
              //     TextWidget(text: 'AB12CD345E Confirmed. Ksh 32,500.00 sent to John Appleseed 0701 234 567 on 25/01/23 at 10:00 AM',
              //       size: 10.50.sp,bold: FontWeight.w400,color: HexColor("#282A38"),),
              //
              //     Row(
              //
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         GestureDetector(
              //           onTap:(){},
              //           child: TextWidget(text: 'Receipt',
              //             size: 10.sp,bold: FontWeight.w500,color: HexColor("#282A38"),),
              //         ),
              //         Row(
              //
              //           children: [
              //             SvgPicture.asset('assets/images/rightcorrect.svg'),
              //             SizedBox(width: 1.w,),
              //             TextWidget(text: 'Cleared',
              //               size: 12.sp,bold: FontWeight.w500,color: HexColor("#5141BF"),),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
            ),
          );
        });
  }
}
