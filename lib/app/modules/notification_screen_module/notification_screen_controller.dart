import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../string/hexcolor.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class NotificationScreenController extends GetxController{
  bool toggleValue = false;
  bool toggleValue1 = false;
  bool toggleValue2 = false;

  final List<String> itemList = ['None','On due day', '1 day before', '2 days before','3 days before'];
  final List<String> selectedItems = [];
  void showAlertDialog(BuildContext context) {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        content: Container(
          height: 38.h,
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: itemList.length,
            itemBuilder: (context, index) {
              String item = itemList[index];
              bool isSelected = selectedItems.contains(item);
              return ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    isSelected? Icon(Icons.check, color:HexColor("#5B5E67"))
                        : Icon(Icons.check, color:Colors.transparent),
                    SizedBox(width: 4.w,),
                    Text(item),
                  ],
                ),
                onTap: () {
                  if (isSelected) {
                    selectedItems.remove(item);
                  } else {
                    if(selectedItems.isNotEmpty){
                      selectedItems.clear();
                    }
                    selectedItems.add(item);
                  }
                  print("add--->$selectedItems");
                  update();
                  Get.back(result: selectedItems);
                },
              );
            },
          ),
        ),
      ),
    );
  }

}
