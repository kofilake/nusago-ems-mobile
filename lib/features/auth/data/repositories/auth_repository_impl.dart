import 'package:dartz/dartz.dart';
import 'package:nusago_ems/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:nusago_ems/features/auth/data/data_sources/auth_remote_data_source.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../../../core/error/failure.dart';

/// Concrete implementation of the AuthRepository contract.
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, String>> loginWithCredentials({
    required String email,
    required String password,
  }) async {
    try {
      final token = await remoteDataSource.loginWithCredentials(
        email,
        password,
      );
//      await localDataSource.cacheToken(token);
      return Right(token);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      final token = await localDataSource.getToken();
      if (token != null) {
        // Step 1: Tell the backend server
        await remoteDataSource.logout(token);
      }
      // Step 2: Delete it locally from secure storage
      await localDataSource.clearToken();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Logout failed'));
    }
  }
}
