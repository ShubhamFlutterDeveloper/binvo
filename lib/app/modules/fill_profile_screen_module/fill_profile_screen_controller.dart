import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../api_collection/api_url_collection.dart';
import '../../../api_collection/dio_api_method.dart';
import '../../../api_collection/shared_prefrences.dart';
import '../../../api_model/SingleFileUpload/fileUpload.dart';
import '../../../api_model/completeProfile/CompleteProfileRequest.dart';
import '../../../api_model/completeProfile/CompleteProfileResponse.dart';
import '../../routes/app_pages.dart';

class FillProfileScreenController extends GetxController{
  TextEditingController profileTextController=TextEditingController();
  bool isCameraAccessDenied = false;
  bool isGalleryAccessDenied = false;
  File? image;
  final ImagePicker _picker = ImagePicker();
  UploadImageResponse uploadImageResponse = UploadImageResponse();
  String imageUrl = "";
  bool isLoading = false;
  bool isImageApiHit = false;
  CompleteProfleResponse completeProfleResponse= CompleteProfleResponse();

  imgFromCamera() async {
    try{
      final pickedImage = await _picker.pickImage(source: ImageSource.camera);
      if (pickedImage != null) {
        image = File(pickedImage.path);
        isImageApiHit = true;
        uploadProfileImage();
        update();
      }
    }catch(e){
      print("exc::${e.toString()}");
      if(isCameraAccessDenied == true){
        AppSettings.openDeviceSettings();
        print("isCameraAccessDenied $isCameraAccessDenied");
      }
      isCameraAccessDenied = true;
      update();
    }
  }
  imgFromGallery() async {
    var galleryStatus = Permission.storage.request();
    if (await galleryStatus.isGranted) {
      final pickedImage = await _picker.pickImage(
          source: ImageSource.gallery, imageQuality: 50);
      if (pickedImage != null) {
        image = File(pickedImage.path);
        isImageApiHit = true;
        uploadProfileImage();
      }
    }
    else {
      if (isGalleryAccessDenied == true) {
        AppSettings.openAppSettings();
      }
      isGalleryAccessDenied = true;
    }
    update();
  }

  // imgFromGallery() async {
  //   if(Platform.isIOS){
  //     try{
  //       final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
  //       if (pickedImage != null) {
  //         image = File(pickedImage.path);
  //         isImageApiHit = true;
  //         uploadProfileImage();
  //       }
  //       update();
  //     }catch(e){
  //       print("exc::${e.toString()}");
  //       if(isGalleryAccessDenied == true){
  //         AppSettings.openDeviceSettings();
  //         print("isGalleryAccessDenied $isGalleryAccessDenied");
  //       }
  //       isGalleryAccessDenied = true;
  //       update();
  //     }
  //   }else{
  //     await Permission.storage.request().then((value)async{
  //       if(value.isGranted){
  //         final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
  //         if (pickedImage != null) {
  //           image = File(pickedImage.path);
  //           isImageApiHit = true;
  //           uploadProfileImage();
  //         }
  //       }else{
  //         if(isGalleryAccessDenied == true){
  //           AppSettings.openDeviceSettings();
  //           print("isGalleryAccessDenied $isGalleryAccessDenied");
  //         }
  //         isGalleryAccessDenied = true;
  //       }
  //       update();
  //     });
  //   }
  // }

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

  uploadProfileImage() async {
    var request = http.MultipartRequest("POST", Uri.parse("http://binvo.deploywork.com:4409/api/v1/auth/file-upload"));
    Map<String, String> headers = {
      "Authorization": "Bearer ${await PreferenceManager.get().getAccessToken()}",
      "Content-Type": "multipart/form-data"
    };
    if (image != null) {
      request.files.add(
        http.MultipartFile(
          "image",
          image!.readAsBytes().asStream(),
          image!.lengthSync(),
          filename: image!.path,
        ),
      );
    }
    request.headers.addAll(headers);
    final response = await request.send();
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    uploadImageResponse = UploadImageResponse.fromJson(jsonDecode(responseString));
    if (uploadImageResponse.code == 200) {
      isImageApiHit = false;
      imageUrl = uploadImageResponse.body?[0] ?? "";
    } else {
      isImageApiHit = false;
    }
    update();
  }

  completeProfileApi()async{
    try{
      final request = CompleteProfleRequest(
          profilePic: imageUrl,
          name: profileTextController.text
      );
      print("profile request--->>${request.toJson()}");
      var response = await DioClient.get().dioPostMethod(ApiUrl.completeProfile, request);
      print("profile response--->>${response}");
      completeProfleResponse = CompleteProfleResponse.fromJson(response.data);
      if (completeProfleResponse.code == 200) {
        Get.offAllNamed(Routes.HOME_SCREEN);
        isLoading = false;
        update();
      }else if(completeProfleResponse.code == 401) {
        PreferenceManager.get().preferenceClear();
        Get.offAllNamed(Routes.REGISTRATION_SCREEN);
        isLoading = false;
        DioClient.get().toAst(completeProfleResponse.message.toString());
        update();
      }else {
        DioClient.get().toAst(completeProfleResponse.message.toString());
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



