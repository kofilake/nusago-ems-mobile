import 'package:dio/dio.dart';
import '/core/network/dio_client.dart';
import '/core/network/api_endpoints.dart';
import '/core/error/failure.dart';

class AuthRemoteDataSource {
  final DioClient dioClient;

  AuthRemoteDataSource({required this.dioClient});

  Future<String> loginWithCredentials(String email, String password) async {
    try {
      final response = await dioClient.post(
        ApiEndpoints.loginEnd,
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        final String token = response.data['access_token'] as String;
        DioClient().updateToken(token);
        return token; // Return the raw token string
      } else {
        throw ServerFailure('Login failed with status ${response.statusCode}');
      }
    } catch (e) {
      if (e is DioException && e.type == DioExceptionType.badResponse) {
        final statusCode = e.response?.statusCode ?? 500;
        final message = e.response?.data['message'] ?? 'Unknown API error.';
        throw ServerFailure(message, statusCode: statusCode);
      }
      rethrow;
    }
  }

  Future<void> logout(String token) async {
    await dioClient.post(
      ApiEndpoints.logoutEnd, 
      data: {},
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
       ),
    );
  }
}
