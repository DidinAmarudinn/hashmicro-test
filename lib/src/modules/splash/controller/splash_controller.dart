import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hashmicro_test/src/core/abstract/base_controller.dart';

import '../../../core/di/injector.dart';
import '../../../core/routes/app_pages.dart';
import '../../../core/service/office_service.dart';

class SplashController extends BaseController {
  final _officeService = injector<OfficeService>();
  @override
  void onReady() {
    checOfficeData();
    super.onReady();
  }

  void checOfficeData() {
    Future.delayed(Durations.long4);
    if (_officeService.getOfficeLocation() == null) {
      _toAddOffice();
    } else {
      _toHome();
    }
  }

  void _toHome() {
    Get.offAllNamed(Routes.home);
  }
  void _toAddOffice() {
    Get.offAllNamed(Routes.addOffice);
  }
}
