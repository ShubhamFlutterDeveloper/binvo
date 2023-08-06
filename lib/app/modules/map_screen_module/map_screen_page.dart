import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:binvo/app/modules/map_screen_module/map_screen_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class MapScreenPage extends GetView<MapScreenController> {
  final mapScreenController=Get.find<MapScreenController>();
  @override
  Widget build(BuildContext context) {
/*    mapScreenController.getUserCurrentLocation().then((value) async {
      print(value.latitude.toString() +" "+value.longitude.toString());

      mapScreenController.markers.add(
          Marker(
            markerId: MarkerId("2"),
            position: LatLng(value.latitude, value.longitude),
            infoWindow: InfoWindow(
              title: 'My Current Location',
            ),
          )
      );

      CameraPosition cameraPosition = CameraPosition(
        target: LatLng(value.latitude, value.longitude),
        zoom: 14,
      );

      final GoogleMapController controller = await mapScreenController.controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      mapScreenController.update();
    });*/
    return GetBuilder(
      init: mapScreenController,
      builder: (_) {
        return Scaffold(
          body: Container(
            child: SafeArea(
              child: GoogleMap(
                initialCameraPosition: mapScreenController.kGoogle,
                markers: Set<Marker>.of(mapScreenController.markers),
                mapType: MapType.hybrid,
                myLocationEnabled: true,
                myLocationButtonEnabled:false,
                zoomControlsEnabled: false,
                onMapCreated: (GoogleMapController controller){
                  mapScreenController.controller.complete(controller);
                },
              ),
            ),
          ),
        );
      }
    );
  }
}
