import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'src/core/di/injector.dart' as di;
import 'src/core/routes/app_pages.dart';
import 'src/core/ui_constants/app_fonts.dart';

void main() async {
  await GetStorage.init();
  await di.initializeDependencies();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INTIAL,
      getPages: AppPages.routes,
      theme: ThemeData.light(
        useMaterial3: false,
      ).copyWith(
        textTheme: AppTextTheme.theme,
      ),
    ),
  );
}
