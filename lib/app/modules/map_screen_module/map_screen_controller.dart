import 'dart:async';
import 'dart:convert';
import 'package:binvo/api_model/MarkerModal/markerResponse.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../api_collection/api_url_collection.dart';
import '../../../api_collection/dio_api_method.dart';

/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class MapScreenController extends GetxController{

 Completer<GoogleMapController> controller = Completer();
 final CameraPosition kGoogle = const CameraPosition(
  target: LatLng(15.8700, 100.9925),
  zoom: 14.4746,
 );
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDetailApi();
  }
 final List<Marker>
 markers = <Marker>[];

 Future<Position> getUserCurrentLocation() async {
  await Geolocator.requestPermission().then((value){
  }).onError((error, stackTrace) async {
   await Geolocator.requestPermission();
   print("ERROR"+error.toString());
  });
  return await Geolocator.getCurrentPosition();
 }
 MarkerResponse markerResponse=MarkerResponse();


 Future getDetailApi() async {
  var response = await DioClient.get().dioGetMethod("${ApiUrl.mapApi}?latitude${15.8700}&longitude${100.9925}");
  markerResponse = MarkerResponse.fromJson(response.data);
  print("response---> ${markerResponse.toJson()}");
  if(markerResponse.code==200) {
    for (final station in markerResponse.body!) {
      final lat = double.parse(station.latitude!);
      final lng = double.parse(station.longitude!);
      final marker = Marker(
        markerId: MarkerId(station.id.toString()),
        position: LatLng(lat, lng),
        onTap: () {

        },
      );
      markers.add(marker);
      update();
    }

  }
   else{}
  }
 }

