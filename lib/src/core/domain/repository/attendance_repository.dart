import 'package:hashmicro_test/src/core/data/model/attendance_model.dart';
import 'package:hashmicro_test/src/core/domain/entity/attendance_entity.dart';
import 'package:hashmicro_test/src/core/utils/type_def.dart';

abstract class AttendanceRepository {
   FutureEither<String> insertAttendance(AttendanceModel attendance);
   FutureEither<List<AttendanceEntity>> getAttendances();
}