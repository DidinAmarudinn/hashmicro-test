import 'package:hashmicro_test/src/core/data/model/attendance_model.dart';
import 'package:hashmicro_test/src/core/domain/repository/attendance_repository.dart';

import '../../abstract/usecase.dart';
import '../../utils/type_def.dart';
class InsertAttendanceUsecase extends Usecase<String, AttendanceModel> {
  final AttendanceRepository _repository;

  InsertAttendanceUsecase(this._repository);

  @override
  FutureEither<String> call(AttendanceModel params) {
    return _repository.insertAttendance(params);
  }
}