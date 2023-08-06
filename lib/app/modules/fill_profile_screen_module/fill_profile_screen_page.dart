import 'package:binvo/api_collection/dio_api_method.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:binvo/app/modules/fill_profile_screen_module/fill_profile_screen_controller.dart';
import 'package:sizer/sizer.dart';
import '../../helper_widget/TextField_widget.dart';
import '../../helper_widget/button.dart';
import '../../helper_widget/text_widget.dart';
import '../../string/hexcolor.dart';
import '../../theme/app_colors.dart';

class FillProfileScreenPage extends GetView<FillProfileScreenController> {
  final fillProfileScreenController=Get.find<FillProfileScreenController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: fillProfileScreenController,
        builder: (_) {
          return Scaffold(
            backgroundColor: HexColor("#FFFFFF"),
            body: ListView(
              children: [
                SizedBox(height: 4.h,),
                TextWidget(text: "Complete profile", size: 12.sp, bold:FontWeight.w600,alignment: TextAlign.center,),
                SizedBox(height: 1.5.h,),
                Divider(
                  height: 1.h,
                  thickness:0.2.w ,
                  color:HexColor("#F3F5F9"),
                ),
                SizedBox(height: 2.h,),
                Center(
                    child: GestureDetector(
                      onTap: () {
                        fillProfileScreenController.showPicker(context);
                      },
                      child:
                      fillProfileScreenController.image != null
                          ? Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              fillProfileScreenController.showPicker(context);
                            },
                            child: CircleAvatar(
                                radius: 6.2.h,
                                backgroundColor: HexColor("#F3F5F9"),
                                child: CircleAvatar(
                                  radius: 6.h,
                                  backgroundColor:HexColor("#F3F5F9"),
                                  backgroundImage: Image.file(
                                    fillProfileScreenController.image!,
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
                            radius: 7.h,
                            backgroundColor: HexColor("#F3F5F9"),
                          ),
                    )),
                SizedBox(height: 2.h,),
                TextWidget(text: 'Set photo', size: 12.sp, bold: FontWeight.normal,color: HexColor("#5141BF"),alignment: TextAlign.center,),
                SizedBox(height: 5.h,),
                Padding(
                  padding:EdgeInsets.only(left: 4.w,right: 4.w),
                  child: TextFieldWidget(
                      onChanged: (val){
                        fillProfileScreenController.update();
                      },
                      hintText: "Your Name",
                      hintStyle: TextStyle(color: HexColor('#777A85'),
                          fontWeight: FontWeight.w600,
                          fontSize: 13.sp),
                      controller:fillProfileScreenController.profileTextController ),
                ),
                SizedBox(height: 10.h,),
                Center(
                  child: RichText(text: TextSpan(
                      text:'By signing up you agree to Binvo’s',
                      style: TextStyle(fontSize: 12.sp,color: HexColor("#5B5E67"),fontWeight: FontWeight.w500),
                      children: [
                        TextSpan(text: " Terms ",style: TextStyle(fontSize: 12.sp,color: HexColor('#5141BF'),fontWeight: FontWeight.w600)),
                        TextSpan(text: "and ",style: TextStyle(fontSize: 12.sp,color: HexColor('#5B5E67'),fontWeight: FontWeight.w600)),
                        TextSpan(text: "Policy ",style: TextStyle(fontSize: 12.sp,color: HexColor('#5141BF'),fontWeight: FontWeight.w600)),
                      ]
                  )
                  ),
                ),
                SizedBox(height: 1.h,),
                fillProfileScreenController.isLoading == false
                    ? Button(
                  firstWidget: TextWidget(text: "Done",size:13.sp ,bold:FontWeight.normal, ),onPressed: () {
                    if (fillProfileScreenController.profileTextController.text.isNotEmpty) {
                    if(fillProfileScreenController.isImageApiHit == true){
                      DioClient.get().toAst("Loading...");
                      return;
                    }
                    fillProfileScreenController.isLoading = true;
                    fillProfileScreenController.completeProfileApi();
                    fillProfileScreenController.update();
                    }
                  },
                  backGroundColor: fillProfileScreenController.profileTextController.text.isNotEmpty ? HexColor("#5141BF") : HexColor("#D7D3F0"),
                )
                    : Container(
                    padding: EdgeInsets.only(top: 4.h),
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                  color: primaryTextColor,
                ))
              ],
            ),
          );
        }
    );
  }
}
