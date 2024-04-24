import 'package:get_it/get_it.dart';
import 'package:hashmicro_test/src/core/data/datasource/local_data_source.dart';
import 'package:hashmicro_test/src/core/data/repository/attendance_repository_impl.dart';
import 'package:hashmicro_test/src/core/domain/repository/attendance_repository.dart';
import 'package:hashmicro_test/src/core/domain/usecase/get_attendance_usecase.dart';
import 'package:hashmicro_test/src/core/domain/usecase/insert_attendance_usecase.dart';
import 'package:hashmicro_test/src/core/service/office_service.dart';

import '../helper/database_helper.dart';

final injector = GetIt.I;

Future<void> initializeDependencies() async {
  injector.registerLazySingleton<OfficeService>(
    () => OfficeService(),
  );

  injector.registerLazySingleton<LocalDataSource>(
    () => LocalDataSourceImpl(injector()),
  );

  injector.registerLazySingleton<AttendanceRepository>(
    () => AttendanceRepositoryImpl(injector()),
  );

  // usecase
  injector.registerLazySingleton(() => InsertAttendanceUsecase(injector()));
  injector.registerLazySingleton(() => GetAttendanceUsecase(injector()));

  // Helper
  injector.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());
}
