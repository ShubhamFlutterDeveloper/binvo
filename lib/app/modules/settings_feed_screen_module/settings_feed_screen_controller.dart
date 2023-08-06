import 'package:get/get.dart';

import '../../../api_collection/api_url_collection.dart';
import '../../../api_collection/dio_api_method.dart';
import '../../../api_model/GetMyDetail/GetMyDetailResponse.dart';
import '../../helper_widget/currencyPicker/currency.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class SettingsFeedScreenController extends GetxController{
  Currency ? selectedCurrency;
  @override
  void onInit() {
    getDetailApi();
    super.onInit();
  }
  GetMyDetailResponse getMyDetailResponse=GetMyDetailResponse();
  Future getDetailApi() async {
    var response = await DioClient.get().dioGetMethod(ApiUrl.getProfile);
    getMyDetailResponse = GetMyDetailResponse.fromJson(response.data);
    print(getMyDetailResponse.toJson());
    update();
  }
}
