import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nusago_ems/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:nusago_ems/features/employees/data/data_sources/employee_remote_data_source.dart';
import 'package:nusago_ems/features/employees/data/repositories/employee_repository_impl.dart';
import 'package:nusago_ems/features/employees/domain/repositories/employee_repository.dart';
import 'package:nusago_ems/features/employees/presentation/bloc/employee_list_bloc.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/data/data_sources/auth_remote_data_source.dart';

import 'core/network/dio_client.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // FEATURES - AUTH
  sl.registerFactory(() => AuthBloc(authRepository: sl()));

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: sl(), 
      localDataSource: sl()
    ),
  );

  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(dioClient: sl()),
  );

  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSource(secureStorage: sl()),
  );

  sl.registerLazySingleton(() => DioClient());

  sl.registerLazySingleton(() => Dio());

  sl.registerLazySingleton(() => const FlutterSecureStorage());

  // FEATURES - EMPLOYEES
  sl.registerFactory(() => EmployeeListBloc(repository: sl()));

  sl.registerLazySingleton<EmployeeRepository>(
    () => EmployeeRepositoryImpl(remoteDataSource: sl()),
  );

  sl.registerLazySingleton(() => EmployeeRemoteDataSource(dioClient: sl()));
}
