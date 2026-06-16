// lib/features/auth/data/datasources/auth_remote_data_source.dart

import 'package:dio/dio.dart';
import '/core/network/dio_client.dart';
import '/core/network/api_endpoints.dart';
import '/core/error/failure.dart';

class AuthRemoteDataSource {
  final DioClient dioClient;

  AuthRemoteDataSource({required this.dioClient});

  // Login Implementation
  Future<String> loginWithCredentials(String email, String password) async {
    try {
      // 1. Call the API endpoint defined in ApiEndpoints
      final response = await dioClient.post(
        ApiEndpoints.loginEnd,
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        // Assuming Laravel returns a token like {'access_token'}
        final String token = response.data['access_token'] as String;
        DioClient().updateToken(token);
        return token; // Return the raw token string
      } else {
        throw ServerFailure('Login failed with status ${response.statusCode}');
      }
    } catch (e) {
      // Catch Dio errors and re-throw them as our custom Failure type
      if (e is DioException && e.type == DioExceptionType.badResponse) {
        final statusCode = e.response?.statusCode ?? 500;
        final message = e.response?.data['message'] ?? 'Unknown API error.';
        throw ServerFailure(message, statusCode: statusCode);
      }
      // Re-throw other errors (network failure, etc.)
      rethrow;
    }
  }

  Future<void> logout(String token) async {
    await dioClient.post(ApiEndpoints.logoutEnd, data: {});
  }
}
