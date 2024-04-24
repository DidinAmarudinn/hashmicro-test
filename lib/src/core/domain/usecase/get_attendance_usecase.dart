import 'package:hashmicro_test/src/core/domain/entity/attendance_entity.dart';
import 'package:hashmicro_test/src/core/domain/repository/attendance_repository.dart';

import '../../abstract/usecase.dart';
import '../../utils/type_def.dart';
class GetAttendanceUsecase extends Usecase<List<AttendanceEntity>, NoParams> {
  final AttendanceRepository _repository;

  GetAttendanceUsecase(this._repository);

  @override
  FutureEither<List<AttendanceEntity>> call(NoParams params) {
    return _repository.getAttendances();
  }
}