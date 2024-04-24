import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hashmicro_test/src/core/ui_constants/app_colors.dart';
import 'package:hashmicro_test/src/core/ui_constants/app_size.dart';

class BaseController extends GetxController {
  RxBool isLoading = false.obs;

  void toastSuccess(
      {required String title,
      required String message,
      Duration? duration,
      SnackPosition? position,
      double? pading}) {
    Get.snackbar(
      title,
      message,
      colorText: AppColors.white,
      backgroundColor: AppColors.green.withOpacity(0.8),
      snackPosition: position ?? SnackPosition.TOP,
      borderWidth: 0.5,
      borderColor: AppColors.green,
      margin: const EdgeInsets.symmetric(
          vertical: AppSize.bigPadding, horizontal: AppSize.smallPadding),
      duration: duration ?? const Duration(seconds: 3),
    );
  }

  void toastError(
      {required String title, required String message, Duration? duration}) {
    Get.snackbar(
      title,
      message,
      colorText: AppColors.white,
      backgroundColor: AppColors.red.withOpacity(0.8),
      snackPosition: SnackPosition.TOP,
      borderWidth: 0.5,
      borderColor: AppColors.red,
      margin: const EdgeInsets.symmetric(
          vertical: AppSize.bigPadding, horizontal: AppSize.smallPadding),
      duration: duration ?? const Duration(seconds: 3),
    );
  }
}
