import 'package:get/get.dart';
import 'package:hashmicro_test/src/modules/attendance/controller/attendance_controller.dart';
class AttendanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AttendanceController>(
      () => AttendanceController(),
    );
  }
}
