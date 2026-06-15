import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/data/data_sources/auth_remote_data_source.dart';
import 'core/network/dio_client.dart'; 

final sl = GetIt.instance;

Future<void> init() async {
  // 1. Register BLoC
  sl.registerFactory(() => AuthBloc(authRepository: sl()));

  // 2. Register Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: sl()),
  );

  // 3. Register Data Source (FIXED)
  sl.registerLazySingleton<AuthRemoteDataSource>(
    // Changed this from AuthRepositoryImpl to AuthRemoteDataSource and passed in the sl() to fetch the DioClient.
    () => AuthRemoteDataSource(dioClient: sl()), 
  );

  // 4. Register Core/Network
  sl.registerLazySingleton(() => DioClient());

  // 5. Register External Packages (Dio)
  sl.registerLazySingleton(() => Dio());
}