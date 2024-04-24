import 'package:dartz/dartz.dart';
import 'package:hashmicro_test/src/core/abstract/usecase.dart';
import 'package:hashmicro_test/src/core/data/datasource/local_data_source.dart';
import 'package:hashmicro_test/src/core/data/model/attendance_model.dart';
import 'package:hashmicro_test/src/core/domain/entity/attendance_entity.dart';
import 'package:hashmicro_test/src/core/domain/repository/attendance_repository.dart';
import 'package:hashmicro_test/src/core/utils/type_def.dart';

class AttendanceRepositoryImpl extends AttendanceRepository {
  final LocalDataSource localDataSource;

  AttendanceRepositoryImpl(this.localDataSource);

  @override
  FutureEither<String> insertAttendance(AttendanceModel attendance) async {
    try {
      await localDataSource.insertAttendance(attendance);
      return const Right("Success add attendance");
    } catch (e) {
      return Left(Failure(code: "", detail: e.toString()));
    }
  }

  @override
  FutureEither<List<AttendanceEntity>> getAttendances() async {
    try {
      final result = await localDataSource.getAttendances();
      return Right(result.map((model) => model.toEntity()).toList());
    } catch (e) {
      return Left(Failure(code: "", detail: e.toString()));
    }
  }
}
