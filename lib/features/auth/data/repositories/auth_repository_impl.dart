import 'package:dartz/dartz.dart';
import 'package:nusago_ems/features/auth/data/data_sources/auth_remote_data_source.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../../../core/error/failure.dart';

/// Concrete implementation of the AuthRepository contract.
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, String>> loginWithCredentials({
    required String email,
    required String password,
  }) async {
    final token = await remoteDataSource.loginWithCredentials(email, password);
    return Right(token);
  }

  @override
  Future<Either<Failure, void>> logout() async {
    // Simulate clearing local tokens/cache
    await Future.delayed(const Duration(milliseconds: 300));
    return const Right(null);
  }
}
