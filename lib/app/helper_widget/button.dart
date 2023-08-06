import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../string/hexcolor.dart';

class Button extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? firstWidget;
  final Widget? secondWidget;
  final Color? backGroundColor;

  const Button({
    super.key,
    this.onPressed,
    this.firstWidget,
    this.secondWidget,
    this.backGroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(2.h),
      child: Container(
        margin: EdgeInsets.only(top: 0.2.h),
        decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(2.h),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              minimumSize: Size(double.maxFinite, 6.5.h), backgroundColor:backGroundColor??HexColor("#5141BF"),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1.h),
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              firstWidget ?? SizedBox.shrink(),
              SizedBox(width: 1.w),
              secondWidget ?? SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}









