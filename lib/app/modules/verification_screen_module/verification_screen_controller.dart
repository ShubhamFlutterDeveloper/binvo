import 'dart:async';
import 'package:get/get.dart';
import '../../../api_collection/api_url_collection.dart';
import '../../../api_collection/dio_api_method.dart';
import '../../../api_model/otpVerification/OtpVerifyRequest.dart';
import '../../../api_model/otpVerification/OtpVerifyResponse.dart';
import '../../routes/app_pages.dart';

class VerificationScreenController extends GetxController{

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  var arg = Get.arguments;
  String? otpCode;
  Timer? timer;
  int remainingSeconds = 30;
  OtpVerifyResponse otpVerifyResponse =OtpVerifyResponse();
  bool isCodeInvalid = false;

  startTimer(){
    const duration = Duration(seconds: 1);
    timer = Timer.periodic(duration, (Timer timer) {
      if(remainingSeconds==0){
        timer.cancel();
      }else{
        remainingSeconds--;
      }
      update();
    });
  }

  verifyOtpApi() async{
    final request = OtpVerifyRequest(otp: int.parse(otpCode ?? ""));
    var response = await DioClient.get().dioPostMethod(ApiUrl.confirmOtp, request);
    otpVerifyResponse = OtpVerifyResponse.fromJson(response.data);
    print("status code---->${otpVerifyResponse.code}");
    if(otpVerifyResponse.code == 200) {
      Get.offAllNamed(Routes.FILL_PROFILE_SCREEN);
      update();
    }else{
      isCodeInvalid = true;
      update();
    }
  }
}
