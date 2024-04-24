import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hashmicro_test/src/core/abstract/base_controller.dart';
import 'package:hashmicro_test/src/core/constants/icon_constants.dart';
import 'package:hashmicro_test/src/core/di/injector.dart';
import 'package:hashmicro_test/src/core/data/model/office_location_model.dart';
import 'package:hashmicro_test/src/core/routes/app_pages.dart';
import 'package:hashmicro_test/src/core/service/office_service.dart';
import 'package:hashmicro_test/src/core/utils/location_decoder.dart';

class AddOfficeController extends BaseController {
  final _officeService = injector<OfficeService>();
  final intialLocation = Rxn<LatLng>();
  final officeLocation = Rxn<LatLng>();
  final officeNameController = TextEditingController();
  final mapMarker = RxSet<Marker>({});
  Rx<BitmapDescriptor> officePinIcon = BitmapDescriptor.defaultMarker.obs;
  RxString officeDetail = "".obs;
  RxBool isEdit = false.obs;
  @override
  void onInit() async {
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      await Geolocator.requestPermission();
    }
    await initData();
    getIntializeLocation();
    super.onInit();
  }

  Future<void> initData() async {
    if (Get.arguments is OfficeLocationModel) {
      final arg = Get.arguments as OfficeLocationModel;
      officeNameController.text = arg.officeName;
      officeLocation.value = LatLng(arg.lat, arg.long);
      intialLocation.value = officeLocation.value;
      isEdit.value = true;
      getDetailLocation();
    }
  }

  void getIntializeLocation() async {
    // permission check
    if (!(await Geolocator.isLocationServiceEnabled())) {
      return;
    }
    if (isEdit.isFalse) {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      // get intial location
      double lat = position.latitude;
      double long = position.longitude;
      intialLocation.value = LatLng(lat, long);
    }

     officePinIcon.value = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(50, 50)),
      officeIcon,
    );
  }

  void onDragMarker(LatLng latLng) async {
    officeLocation.value = latLng;
    getDetailLocation();
    
  }

  void getDetailLocation() async {
    final officeDesc = await placemarkFromCoordinates(
      officeLocation.value!.latitude,
      officeLocation.value!.longitude,
    );
    officeDetail.value = LocationDecoder.convert(officeDesc);
  }

  void saveOffice() async {
    if (officeLocation.value == null) {
      return;
    }
    final office = OfficeLocationModel(
      officeName: officeNameController.text,
      lat: officeLocation.value!.latitude,
      long: officeLocation.value!.longitude,
    );
    isLoading.toggle();
    _officeService.setOfficeLocation(office);
    await Future.delayed(Durations.long4);
   
    isLoading.toggle();
    Get.offAllNamed(Routes.home);
  }
}
