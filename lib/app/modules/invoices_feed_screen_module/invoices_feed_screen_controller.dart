import 'package:binvo/app/helper_widget/TextField_widget.dart';
import 'package:binvo/app/helper_widget/text_widget.dart';
import 'package:binvo/app/string/hexcolor.dart';
import 'package:binvo/app/theme/app_colors.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class InvoicesFeedScreenController extends GetxController{
  var selectedMonth = DateTime.now().obs;
TextEditingController searchNumberController = TextEditingController();
  void goToNextMonth() {
    selectedMonth.value = DateTime(selectedMonth.value.year, selectedMonth.value.month + 1, selectedMonth.value.day);}

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

    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: 270,
            width: 90,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                            color:Colors.black,
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
    );
  }
  List<Contact> contacts = <Contact>[].obs;
  RxList<Contact> filteredContacts = RxList<Contact>();

  Future<void> fetchContacts() async {
    final PermissionStatus permissionStatus = await Permission.contacts.request();
    if (permissionStatus.isGranted) {
      final Iterable<Contact> fetchedContacts = await ContactsService.getContacts();
      contacts.assignAll(fetchedContacts.toList());
      filteredContacts.assignAll(fetchedContacts.toList());
    } else {
      print('Contacts permission denied');
    }
  }
  void filterContacts(String query) {
    final List<Contact> filteredList = contacts.where((contact) {
      final String displayName = contact.displayName?.toLowerCase() ?? '';
      return displayName.contains(query.toLowerCase());
    }).toList();
    filteredContacts.assignAll(filteredList);
  }

  void filterContactsByAlphabet(String alphabet) {
    final List<Contact> filteredList = contacts.where((contact) {
      final String displayName = contact.displayName?.toLowerCase() ?? '';
      return displayName.startsWith(alphabet.toLowerCase());
    }).toList();
    filteredContacts.assignAll(filteredList);
  }
  //contactsSheet
  void showContactBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(2.h),
          topLeft: Radius.circular(2.h),
        ),
      ),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            height: 90.h,
            child: Obx(
                  () => Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(height: 4.h,),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 4.w),
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {Get.back();},
                          child: TextWidget(text: "Cancel", size: 12.sp, bold: FontWeight.w400,color: HexColor("#5141BF"),)),
                     SizedBox(width: 20.w,),
                     TextWidget(text: "New invoice to", size: 12.sp, bold: FontWeight.w600,color: primaryTextColor,),
                      ],
                  ),
                    ),
                  SizedBox(height: 3.h,),
                  Divider(color: HexColor("#F3F5F9"), height: 3,thickness: 1,),
                  SizedBox(height: 2.2.h,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 4.w),
                    child: TextFieldWidget(hintText: "Search by name or number",
                      prefixIcon: Icon(Icons.search,color: HexColor("#5B5E67"),size: 3.h,),
                      controller: searchNumberController,
                      fillColor: HexColor("#F3F5F9"),hintStyle: TextStyle(color: HexColor("#5B5E67"),fontSize: 12.sp,fontWeight: FontWeight.w600),),
                  ),
                  SizedBox(height: 2.2.h,),
                  // Container(
                  //   height: 12.h,
                  //   width: double.maxFinite,
                  //   padding: EdgeInsets.symmetric(horizontal: 4.w),
                  //   margin: EdgeInsets.symmetric(horizontal: 4.w),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(1.2.w),
                  //     border: Border.all(color: HexColor("#F0F1F3"))
                  //   ),
                  //   child: Column(
                  //     children: [
                  //
                  //     ],
                  //   ),
                  // ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredContacts.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Contact contact = filteredContacts[index];
                        final String displayName = contact.displayName ?? '';
                        final List<Item> phoneNumbers = contact.phones?.toList() ?? [];
                        final String alphabet = displayName[0].toUpperCase();
                        if (index == 0 || alphabet != filteredContacts[index - 1].displayName![0].toUpperCase()) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  alphabet,
                                  style: const TextStyle(
                                    color: Color(0xFF777A85),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text(displayName),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    for (Item phoneNumber in phoneNumbers)
                                      Text(phoneNumber.value ?? ''),
                                  ],
                                ),
                                onTap: () {},
                                leading: const CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.grey,
                                ),
                              ),
                            ],
                          );
                        }

                        return ListTile(
                          title: Text(displayName),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (Item phoneNumber in phoneNumbers)
                                Text(phoneNumber.value ?? ''),
                            ],
                          ),
                          onTap: () {},
                          leading: const CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  @override
  void onInit() {
fetchContacts();
super.onInit();
  }
}


