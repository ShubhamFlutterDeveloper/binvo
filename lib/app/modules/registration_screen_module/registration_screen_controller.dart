import 'dart:async';
import 'package:country_list_pick/support/code_country.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../api_collection/api_url_collection.dart';
import '../../../api_collection/dio_api_method.dart';
import '../../../api_collection/shared_prefrences.dart';
import '../../../api_model/SignUpModel/SignUpRequest.dart';
import '../../../api_model/SignUpModel/SignUpRespomse.dart';
import '../../routes/app_pages.dart';

class RegistrationScreenController extends GetxController{
  String selectedCountryCode = '';
  CountryCode? selectedCountry;
  SignUpResponse signUpResponse = SignUpResponse();
  bool isLoading = false;
  TextEditingController textController=TextEditingController();

  void onCountryChange(CountryCode? countryCode) {
    selectedCountry = countryCode;
    print("code${selectedCountryCode}");
    print("codess${selectedCountry}");
   update();
  }

  registrationApi() async{
    try{
      final request = SignUpRequest(
        mobileNo: textController.text,
        countryCode:int.parse(selectedCountry.toString()),
      );
      print(request);
      var response = await DioClient.get().dioPostMethod(ApiUrl.signUp, request);
     signUpResponse=SignUpResponse.fromJson(response.data);
     if (signUpResponse.code == 200) {
        PreferenceManager.get().setAccessToken(signUpResponse.body?.token ?? "");
        Get.toNamed(Routes.VERIFICATION_SCREEN, arguments: textController.text );
        isLoading = false;
        update();
      } else{
        DioClient.get().toAst(signUpResponse.message.toString());
        isLoading = false;
        update();
      }}
    catch(e){
      Timer(const Duration(seconds: 1), () {
        isLoading=false;
        update();
      });
      //DioClient.get().toAst(loginResponse.message.toString());
    }
  }

}
