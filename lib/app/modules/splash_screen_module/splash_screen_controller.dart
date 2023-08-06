import 'dart:async';
import 'package:binvo/api_collection/shared_prefrences.dart';
import 'package:get/get.dart';
import '../../../api_collection/api_url_collection.dart';
import '../../../api_collection/dio_api_method.dart';
import '../../../api_model/GetMyDetail/GetMyDetailResponse.dart';
import '../../routes/app_pages.dart';

class SplashScreenController extends GetxController{
  @override
  GetMyDetailResponse getMyDetailResponse=GetMyDetailResponse();
  Future getDetailApi() async {
    var response = await DioClient.get().dioGetMethod(ApiUrl.getProfile);
    getMyDetailResponse = GetMyDetailResponse.fromJson(response.data);
    print(getMyDetailResponse.toJson());
   if(getMyDetailResponse.code==200){
     print("otpVerify::::${getMyDetailResponse.body?.isOtpVerify}");
     print("isProfile::::${getMyDetailResponse.body?.isProfile}");
     if(getMyDetailResponse.body?.isOtpVerify=="0"){
       Get.toNamed(Routes.VERIFICATION_SCREEN);
     }
     else if (getMyDetailResponse.body?.isProfile=="0"){
       Get.offAllNamed(Routes.FILL_PROFILE_SCREEN);
     }
     else{
       Get.offAllNamed(Routes.HOME_SCREEN);
     }
   }
    update();
  }
  void onInit() async{

    var getPref = await PreferenceManager.get().getAccessToken();
    var isAppAlreadyInstalled = await PreferenceManager.get().getMainOnBoardValue();
    print("PREF:::$getPref");
    print("APP VALUE:::$isAppAlreadyInstalled");
    Timer( Duration(seconds: 3), () {
      if(getPref != null){
        getDetailApi();
      }else if(getPref == null && isAppAlreadyInstalled != null){
        Get.offNamed(Routes.MAP_SCREEN);
      }else if(getPref == null && isAppAlreadyInstalled == null){
        Get.offNamed(Routes.MAP_SCREEN);
      }
    });
    super.onInit();
  }
}
