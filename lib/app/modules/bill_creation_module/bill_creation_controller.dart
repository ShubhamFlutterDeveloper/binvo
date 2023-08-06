import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';
import '../../../api_collection/api_url_collection.dart';
import '../../../api_collection/dio_api_method.dart';
import '../../../api_collection/shared_prefrences.dart';
import 'package:http/http.dart' as http;
import '../../../api_model/CreateBill/CreateBillRequest.dart';
import '../../../api_model/CreateBill/CreateBillResponse.dart';
import '../../../api_model/SingleFileUpload/fileUpload.dart';
import '../../routes/app_pages.dart';
import '../../string/hexcolor.dart';

class BillCreationController extends GetxController{
  //SelectDatePicker
  bool _decideWhichDayToEnable(DateTime day) {
    if (day.isBefore(DateTime.now().add(const Duration(days: 0)))) {
      return true;
    }
    return false;
  }
  Rx<DateTime> selectedDate = DateTime.now().obs;
  Future<void> showDatePickerDialog(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      //selectableDayPredicate: _decideWhichDayToEnable,
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 10),
    );

    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
    }
  }


  //ImagePicker
  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];
  imgFromCamera() async {
    var cameraStatus = await Permission.camera.request();
    if (cameraStatus.isGranted) {
      if (await cameraStatus.isGranted) {
        final XFile? capturedImage = await imagePicker.pickImage(
          source: ImageSource.camera,
        );
        if (capturedImage != null) {
          imageFileList!.add(capturedImage);
          print("Image List Length: ${imageFileList!.length}");
          update();
        }
      }
      else {
        // if (isCameraAccessDenied == true) {
        //   AppSettings.openAppSettings();
        // }
        // isCameraAccessDenied = true;
      }
      update();
    }
  }
  imgFromGallery() async {
    var galleryStatus = Permission.storage.request();
    if (await galleryStatus.isGranted) {
      final List<XFile>? selectedImages = await
      imagePicker.pickMultiImage();
      if (selectedImages!.isNotEmpty) {
        imageFileList!.addAll(selectedImages);
      }
      print("Image List Length:${imageFileList!.length}");
      // imageFileList?.forEach((element) {print("element:::${element.path}");});
      update();
    }
    else {
      // if (isGalleryAccessDenied == true) {
      //   AppSettings.openAppSettings();
      // }
      // isGalleryAccessDenied = true;
    }
    update();
  }
  void showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    tileColor: Colors.white,
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Photo Library'),
                    onTap: () {
                      imgFromGallery();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  tileColor: Colors.white,
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

//PayableCode

  final List<String> itemList = ['Once','Monthly', 'Yearly'];
  final List<String> selectedItems = [];
  void showAlertDialog(BuildContext context) {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        content: Container(
          height: 20.h,
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: itemList.length,
            itemBuilder: (context, index) {
              String item = itemList[index];
              bool isSelected = selectedItems.contains(item);
              return ListTile(
                title: Row(
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



  //BillCreateApi
  TextEditingController titleController = TextEditingController();
  TextEditingController currencyControlller = TextEditingController();
  TextEditingController notesControlller = TextEditingController();
  TextEditingController repeatController = TextEditingController();
  UploadImageResponse uploadImageResponse = UploadImageResponse();
  CreateBillResponse createBillResponse = CreateBillResponse();
  List<String> imageUrls = [];
  String? selectEndsOption;
  bool isLoading = false;

  uploadProfileImage() async {
    var request = http.MultipartRequest("POST", Uri.parse("http://binvo.deploywork.com:4409/api/v1/auth/file-upload"));
    Map<String, String> headers = {
      "Authorization": "Bearer ${await PreferenceManager.get().getAccessToken()}",
      "Content-Type": "multipart/form-data"
    };
    if(imageFileList!=null){
      for (XFile imageFile in imageFileList!) {
        final file = File(imageFile.path);
        // List<int> fileBytes = await file.readAsBytes();
        // String fileName = imageFile.path.split('/').last;
        request.files.add(http.MultipartFile('image',file.readAsBytes().asStream(),
          file.lengthSync(),
            filename: file.path,
          ),
        );
      }
    }
    request.headers.addAll(headers);
    final response = await request.send();
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    uploadImageResponse = UploadImageResponse.fromJson(jsonDecode(responseString));
    if (uploadImageResponse.code == 200) {
     uploadImageResponse.body?.forEach((element) {
       imageUrls.add(element.toString());
     });
      editBillApi();
    }
    update();
  }

  editBillApi()async{
    try{
      final request = CreateBillRequest(
         billImages: imageUrls,
        title: titleController.text,
        price: double.parse(currencyControlller.text),
        startDate: DateFormat('yyyy-MM-dd').format(selectedDate.value),
        ends:selectEndsOption=="Never"?"0":"1",
        payableType: selectedItems.join(','),
        billNotes: notesControlller.text,
       repeat: repeatController.text.isEmpty?"0":repeatController.text,

      );
      print("createBill request--->>${request.toJson()}");
      var response = await DioClient.get().dioPostMethod(ApiUrl.createBill, request);
      print("createBill request--->>${response}");
      createBillResponse = CreateBillResponse.fromJson(response.data);
      if (createBillResponse.code == 200) {
        Get.offAllNamed(Routes.HOME_SCREEN);
        isLoading = false;
        update();
      }else if(createBillResponse.code == 401) {
        PreferenceManager.get().preferenceClear();
        Get.offAllNamed(Routes.REGISTRATION_SCREEN);
        isLoading = false;
        DioClient.get().toAst(createBillResponse.message.toString());
        update();
      }else {
        DioClient.get().toAst(createBillResponse.message.toString());
        isLoading = false;
        update();
      }
    } catch(e){
      Timer(const Duration(seconds: 1), () {
        isLoading=false;
        update();
      });
    }
  }}


