import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';

/// Defines the contract for authentication operations.
abstract class AuthRepository {
  // Returns Either<Failure, T> to handle success (Right) or failure (Left).
  Future<Either<Failure, String>> loginWithCredentials({
    required String email,
    required String password,
  });

  Future<Either<Failure, void>> checkLoggedIn();

  Future<Either<Failure, void>> logout();
}
