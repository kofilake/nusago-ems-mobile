import 'package:get_it/get_it.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import '../features/auth/data/repositories/auth_repository_impl.dart';
import '../features/auth/domain/repositories/auth_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // 1. BLoC (Factory - new instance every time)
  sl.registerFactory(() => AuthBloc(authRepository: sl()));

  // 2. Repository (Lazy Singleton - single instance, initialized when first used)
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
}
