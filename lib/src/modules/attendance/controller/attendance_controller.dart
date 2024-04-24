import 'package:get/get.dart';
import 'package:hashmicro_test/src/core/abstract/base_controller.dart';
import 'package:hashmicro_test/src/core/abstract/usecase.dart';
import 'package:hashmicro_test/src/core/di/injector.dart';
import 'package:hashmicro_test/src/core/domain/entity/attendance_entity.dart';
import 'package:hashmicro_test/src/core/domain/usecase/get_attendance_usecase.dart';

class AttendanceController extends BaseController {
  final _getAttendance = injector<GetAttendanceUsecase>();
  RxList<AttendanceEntity> attendances = <AttendanceEntity>[].obs;

  @override
  void onInit() {
    getAttendance();
    super.onInit();
  }

  Future<void> getAttendance() async {
    isLoading.value = true;
    final result = await _getAttendance.call(NoParams());
    result.fold((l) {
      Get.snackbar(
        "Failed",
        l.detail ?? "Get data failed",
      );
    }, (r) {
      r.sort((a, b) => (b.time ?? "").compareTo(a.time ?? ""));
      attendances.value = r;
    });
  }
}
