import 'package:hashmicro_test/src/core/data/model/attendance_model.dart';
import 'package:hashmicro_test/src/core/helper/database_helper.dart';

abstract class LocalDataSource {
  Future<void> insertAttendance(AttendanceModel attendance);
  Future<List<AttendanceModel>> getAttendances();
}

class LocalDataSourceImpl extends LocalDataSource {
  final DatabaseHelper databaseHelper;

  LocalDataSourceImpl(this.databaseHelper);
  @override
  Future<List<AttendanceModel>> getAttendances() async {
    final result = await databaseHelper.getAllAttendance();
    return result;
  }

  @override
  Future<void> insertAttendance(AttendanceModel attendance) async {
    await databaseHelper.insertAttendance(attendance);
  }
}
