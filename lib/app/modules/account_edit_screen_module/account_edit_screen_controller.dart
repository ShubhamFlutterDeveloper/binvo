import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:app_settings/app_settings.dart';
import 'package:binvo/api_model/editProfile/editProfileRequest.dart';
import 'package:binvo/api_model/editProfile/editProfileResponse.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

import '../../../api_collection/api_url_collection.dart';
import '../../../api_collection/dio_api_method.dart';
import '../../../api_collection/shared_prefrences.dart';
import '../../../api_model/SingleFileUpload/fileUpload.dart';
import '../../routes/app_pages.dart';
import '../home_screen_module/home_screen_controller.dart';
import '../settings_feed_screen_module/settings_feed_screen_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class AccountEditScreenController extends GetxController{
  final HomeScreenController homeScreenController = Get.put<HomeScreenController>(HomeScreenController());
  final SettingsFeedScreenController settingsFeedScreenController =
  Get.put<SettingsFeedScreenController>(SettingsFeedScreenController());

  TextEditingController profileTextController=TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isCameraAccessDenied = false;
  bool isGalleryAccessDenied = false;

  //imagePickr
  File? image;
  final ImagePicker _picker = ImagePicker();
  imgFromCamera() async {
    var cameraStatus = await Permission.camera.request();
    if (cameraStatus.isGranted) {
      final pickedImage =
      await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);
      if (pickedImage != null) {
        image = File(pickedImage.path);
        isImageApiHit = true;
        uploadProfileImage();
        update();
      }
    } else {
      if (isCameraAccessDenied == true) {
        AppSettings.openAppSettings();
      }
      isCameraAccessDenied = true;
    }
    update();
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
        update();
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


//EditProfileApi
  UploadImageResponse uploadImageResponse = UploadImageResponse();
  EditProfileResponse editProfileResponse = EditProfileResponse();
  String imageUrl = "";
  bool isLoading = false;
  bool isImageApiHit = false;
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
      final request = EditProfileRequest(
          profilePic:imageUrl,
          name: profileTextController.text
      );
      print("profile request--->>${request.toJson()}");
      var response = await DioClient.get().dioPostMethod(ApiUrl.editProfile, request);
      print("profile response--->>${response}");
      editProfileResponse = EditProfileResponse.fromJson(response.data);
      if (editProfileResponse.code == 200) {
        //Get.back(result: true);
       Get.offAllNamed(Routes.HOME_SCREEN);
        isLoading = false;
        update();
      }else if(editProfileResponse.code == 401) {
        PreferenceManager.get().preferenceClear();
        Get.offAllNamed(Routes.REGISTRATION_SCREEN);
        isLoading = false;
        DioClient.get().toAst(editProfileResponse.message.toString());
        update();
      }else {
        DioClient.get().toAst(editProfileResponse.message.toString());
        isLoading = false;
        update();
      }
    } catch(e){
      Timer(const Duration(seconds: 1), () {
        isLoading=false;
        update();
      });
    }
  }

  withoutProfileApi()async{
    try{
      final request = EditProfileRequest(
          name: profileTextController.text
      );
      print("profile request--->>${request.toJson()}");
      var response = await DioClient.get().dioPostMethod(ApiUrl.editProfile, request);
      print("profile response--->>${response}");
      editProfileResponse = EditProfileResponse.fromJson(response.data);
      if (editProfileResponse.code == 200) {
        //Get.back(result: true);
         Get.offAllNamed(Routes.HOME_SCREEN);
        isLoading = false;
        update();
      }else if(editProfileResponse.code == 401) {
        PreferenceManager.get().preferenceClear();
        Get.offAllNamed(Routes.REGISTRATION_SCREEN);
        isLoading = false;
        DioClient.get().toAst(editProfileResponse.message.toString());
        update();
      }else {
        DioClient.get().toAst(editProfileResponse.message.toString());
        isLoading = false;
        update();
      }
    } catch(e){
      Timer(const Duration(seconds: 1), () {
        isLoading=false;
        update();
      });
    }
  }




}



