import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../api_collection/api_url_collection.dart';
import '../../../api_collection/dio_api_method.dart';
import '../../../api_model/GetBill/GetBillResponse.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class BillsFeedScreenController extends GetxController{
  var selectedMonth = DateTime.now().obs;

  String formatDateTime(String timestamp) {
    DateTime dateTime = DateTime.parse(timestamp);
    String formattedDate = DateFormat('d MMM').format(dateTime);
    return formattedDate;
  }
  void goToNextMonth() {
    selectedMonth.value = DateTime(
        selectedMonth.value.year, selectedMonth.value.month + 1,
        selectedMonth.value.day);
  }

  void goToPreviousMonth() {
    selectedMonth.value = DateTime(
        selectedMonth.value.year, selectedMonth.value.month - 1,
        selectedMonth.value.day);
  }
  void showDateSuggestions() {
    final List<DateTime> suggestions = [];
    DateTime nextMonth = DateTime(
      selectedMonth.value.year,
      selectedMonth.value.month + 1,
      selectedMonth.value.day,
    );

    for (int i = 0; i < 11; i++) {
      suggestions.add(nextMonth);
      nextMonth = DateTime(nextMonth.year, nextMonth.month + 1, nextMonth.day);
    }
    showAlignedDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          content: Container(

            height: 40.h,
            // width: 20.w,
            child: SingleChildScrollView(
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text(
                      '${DateFormat('MMM yyyy').format(selectedMonth.value)}',
                      style: TextStyle(
                        color: Color(0xff5141BF), // Change the color as desired
                      ),
                    ),
                    onTap: () {
                      // Handle onTap for the selected month if needed
                    },
                  ),
                  ...suggestions.map(
                        (date) {
                      return ListTile(
                        title: Text(
                          DateFormat('MMM yyyy').format(date),
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onTap: () {
                          selectedMonth.value = date;

                          Get.back();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
        followerAnchor: Alignment.topLeft,
        targetAnchor: Alignment.bottomLeft,
        barrierColor: Colors.transparent
    );
  }

  @override
  void onInit() {
    getBillApi();
    super.onInit();
  }

  //GetBillApi
  GetBillResponse getBillResponse=GetBillResponse();
  Future getBillApi() async {
    var response = await DioClient.get().dioGetMethod(ApiUrl.getBill);
    getBillResponse = GetBillResponse.fromJson(response.data);
    print("getBillResponse${getBillResponse.toJson()}");
    update();
  }
}
