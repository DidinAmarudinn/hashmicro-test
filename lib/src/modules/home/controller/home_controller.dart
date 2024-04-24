import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hashmicro_test/src/core/abstract/base_controller.dart';
import 'package:hashmicro_test/src/core/data/model/attendance_model.dart';
import 'package:hashmicro_test/src/core/di/injector.dart';
import 'package:hashmicro_test/src/core/data/model/office_location_model.dart';
import 'package:hashmicro_test/src/core/domain/usecase/insert_attendance_usecase.dart';
import 'package:hashmicro_test/src/core/service/office_service.dart';
import 'package:hashmicro_test/src/core/ui_constants/app_colors.dart';
import 'package:hashmicro_test/src/core/utils/location_decoder.dart';

import '../../../core/constants/icon_constants.dart';

class HomeController extends BaseController {
  final _officeService = injector<OfficeService>();
  final _insertAttendance = injector<InsertAttendanceUsecase>();
  final myLocation = Rxn<LatLng>();
  final officeLocation = Rxn<LatLng>();
  final mapMarker = RxSet<Marker>({});
  final mapCircle = RxSet<Circle>({});
  final mapCon = Completer<GoogleMapController>();
  final distance = 0.0.obs;
  RxString myLocationDetail = "".obs;
  RxString officeDetail = "".obs;
  RxString officeName = "".obs;
  Rxn<OfficeLocationModel> officeLocationModel = Rxn();
  Timer? _timer;
  @override
  void onInit() async {
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      await Geolocator.requestPermission();
    }
    getOfficeLocation();
    _timer = Timer.periodic(5.seconds, (timer) async {
      getMyLocation();
    });

    ever(myLocation, (callback) {
      if ([myLocation.value, officeLocation.value].contains(null)) return;
      distance.value = Geolocator.distanceBetween(
        myLocation.value!.latitude,
        myLocation.value!.longitude,
        officeLocation.value!.latitude,
        officeLocation.value!.longitude,
      );
    });

    super.onInit();
  }

  void getOfficeLocation() async {
    if (_officeService.getOfficeLocation() != null) {
      final arg = _officeService.getOfficeLocation()!;
      officeName.value = arg.officeName;
      officeLocation.value = LatLng(arg.lat, arg.long);
      officeLocationModel.value = arg;
    } else {
      return;
    }
    final officePinIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(100, 100)),
      officeIcon,
    );
    const markerId = MarkerId('officeMarker');
    final officeMarker = Marker(
        markerId: markerId,
        position: officeLocation.value!,
        icon: officePinIcon,
        infoWindow: InfoWindow(title: officeLocationModel.value?.officeName));
    mapMarker.add(officeMarker);
    const carCircleId = CircleId('car_radius_circle');

    final carCicle = Circle(
      circleId: carCircleId,
      center: officeLocation.value!,
      fillColor: AppColors.primaryColor.withOpacity(0.1),
      strokeWidth: 2,
      strokeColor: AppColors.primaryColor,
      radius: 50,
    );
    mapCircle.add(carCicle);
    final gMapController = await mapCon.future;
    gMapController.showMarkerInfoWindow(markerId);
    // geocoding
    if (officeLocation.value != null) {
      final officeDesc = await placemarkFromCoordinates(
        officeLocation.value!.latitude,
        officeLocation.value!.longitude,
      );
      officeDetail.value = LocationDecoder.convert(officeDesc);
    }
  }

  void getMyLocation() async {
    // permission check
    if (!(await Geolocator.isLocationServiceEnabled())) {
      return;
    }
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    // get my location
    double lat = position.latitude;
    double long = position.longitude;
    myLocation.value = LatLng(lat, long);
    const markerId = MarkerId('myLocationMarker');
    final myLocationMarker =
        Marker(markerId: markerId, position: myLocation.value!);
    mapMarker.add(myLocationMarker);
    final gMapController = await mapCon.future;
    gMapController.showMarkerInfoWindow(markerId);
    // geocoding
    if (myLocation.value != null) {
      final myLocationDesc = await placemarkFromCoordinates(
        myLocation.value!.latitude,
        myLocation.value!.longitude,
      );
      myLocationDetail.value = LocationDecoder.convert(myLocationDesc);
    }
  }

  Future<void> insertAttendance() async {
    isLoading.value = true;
    final params = AttendanceModel(
        time: DateTime.now().toString(),
        latitudeMyLocation: myLocation.value?.latitude,
        longitudeMyLocation: myLocation.value?.longitude,
        latitudeOffice: officeLocation.value?.latitude,
        longitudeOffice: officeLocation.value?.longitude,
        distance: distance.value,
        isValid: distance.value < 50 ? 1 : 0);
    final result = await _insertAttendance.call(params);
    isLoading.value = false;
    result.fold((l) {
      toastError(title: "Failed", message: l.detail ?? "Failed insert data");
    }, (r) {
      toastSuccess(title: "Success", message: "Check-in has successfully!");
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
