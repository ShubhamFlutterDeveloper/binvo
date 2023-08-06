import 'package:binvo/api_collection/shared_prefrences.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import '../app/string/hexcolor.dart';
import 'api_url_collection.dart';

class DioClient {
  DioClient._();
  static DioClient? _instance;

  static DioClient get() {
    _instance ??= DioClient._();
    return _instance!;
  }

  final Dio _dio = Dio(
      BaseOptions(
        baseUrl:ApiUrl.base,
      )
  );

  Future dioGetMethod(String url) async {
    print("what is url-->> $url");
    try {
      Response response = await _dio.get(url,
          options: Options(headers: {
            "Authorization":
            "Bearer ${await PreferenceManager.get().getAccessToken()}"
          }));
      if (response.statusCode == 200) {
        return response;
      } else {
        toAst(response.statusMessage.toString());
      }
    } on DioError catch(e){
      // toAst(e.toString());
      if (e.type == DioErrorType.response) {
        toAst(e.type.toString());
        return;
      }
      if (e.type == DioErrorType.connectTimeout) {
        toAst('check your connection');
        return;
      }

      if (e.type == DioErrorType.receiveTimeout) {
        toAst('unable to connect to the server');
        return;
      }

      if (e.type == DioErrorType.other) {
        toAst('No Internet Connection');
        return;
      }
    } catch (e) {
    }
  }

  Future dioPostMethod(String url, dynamic body) async {
    try {
      Response response = await _dio.post(url,
          data: body,
          options: Options(headers: {
            "Authorization": "Bearer ${await PreferenceManager.get().getAccessToken()}"
          }));
      if (response.statusCode == 200) {
        return response;
      } else {
        toAst(response.statusMessage.toString());
      }
    } on DioError catch (e) {
      //toAst(e.toString());
      if (e.type == DioErrorType.response) {
        toAst(e.type.toString());
        return;
      }
      if (e.type == DioErrorType.connectTimeout) {
        toAst('check your connection');
        return;
      }

      if (e.type == DioErrorType.receiveTimeout) {
        toAst('unable to connect to the server');
        return;
      }

      if (e.type == DioErrorType.other) {
        toAst('No Internet Connection');
        return;
      }
    } catch (e) {

    }
  }

  toAst(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.white,
        textColor: HexColor("#236FE2"),
        fontSize: 10.sp);
  }
}
