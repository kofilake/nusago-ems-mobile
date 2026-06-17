import 'package:dartz/dartz.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../../../core/error/failure.dart';

/// Concrete implementation of the AuthRepository contract.
class AuthRepositoryImpl implements AuthRepository {
  // In a real app, this class would coordinate calls to RemoteDataSource (API) 
  // and LocalDataSource (Cache). Here, we simulate it.
  @override
  Future<Either<Failure, String>> loginWithCredentials({
    required String email,
    required String password,
  }) async {
    // --- SIMULATION START ---
    await Future.delayed(const Duration(milliseconds: 800)); // Simulate network delay

    if (email == 'admin@example.com' && password == 'password') {
      // Success simulation
      return const Right('auth_token_12345');
    } else if (email == 'user@example.com' && password == 'password') {
       // Another success path for testing different roles
      return const Right('auth_token_67890');
    } else {
      // Failure simulation
      return const Left(ServerFailure('Invalid email or password.', statusCode: 401));
    }
    // --- SIMULATION END ---
  }

  @override
  Future<Either<Failure, void>> logout() async {
    // Simulate clearing local tokens/cache
    await Future.delayed(const Duration(milliseconds: 300));
    return const Right(null);
  }
}
