
import 'package:get/get.dart';
import 'package:hashmicro_test/src/modules/attendance/binding/attendance_binding.dart';
import 'package:hashmicro_test/src/modules/attendance/view/attendance_screen.dart';
import 'package:hashmicro_test/src/modules/home/binding/home_binding.dart';
import 'package:hashmicro_test/src/modules/home/view/home_screen.dart';
import 'package:hashmicro_test/src/modules/office/binding/add_office_binding.dart';
import 'package:hashmicro_test/src/modules/office/view/add_office_screen.dart';
import 'package:hashmicro_test/src/modules/splash/binding/splash_binding.dart';

import '../../modules/splash/view/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  // ignore: constant_identifier_names
  static const INTIAL = Routes.splash;
  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.addOffice,
      page: () =>  AddOfficeScreen(),
      binding: AddOfficeBinding(),
    ),
    GetPage(
      name: Routes.attendance,
      page: () =>  const AttendanceScreen(),
      binding: AttendanceBinding(),
    ),
  ];
}
