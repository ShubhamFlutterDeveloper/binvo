import 'package:binvo/app/modules/bills_feed_screen_module/bills_feed_screen_page.dart';
import 'package:binvo/app/modules/invoices_feed_screen_module/invoices_feed_screen_page.dart';
import 'package:binvo/app/modules/settings_feed_screen_module/settings_feed_screen_page.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeScreenController extends GetxController{
  @override
  void onInit() {

    super.onInit();
  }

  List widgetOptions = <Widget>[
   BillsFeedScreenPage(),
   InvoicesFeedScreenPage(),
    SettingsFeedScreenPage()
  ];
  var currentIndex = 0.obs;

  onChangedFunction(int index) {
    currentIndex = index.obs;
    update();
  }

  void accessContacts() async {
    PermissionStatus permissionStatus = await Permission.contacts.request();
    if (permissionStatus.isGranted) {
      Iterable<Contact> contacts = await ContactsService.getContacts();
      for (Contact contact in contacts) {
        String displayName = contact.displayName ?? '';
        List<Item> phoneNumbers = contact.phones?.toList() ?? [];
        print('Contact: $displayName');
        for (Item phoneNumber in phoneNumbers) {
          print('Phone: ${phoneNumber.value}');
        }
      }
    } else {
      if (permissionStatus.isPermanentlyDenied) {
        // Handle the case where the user has permanently denied the permission
      } else {
        // Handle the case where the user denied the permission
      }
    }
  }
}
