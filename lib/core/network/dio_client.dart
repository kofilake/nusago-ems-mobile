// lib/core/network/dio_client.dart
import '/core/error/failure.dart';
import 'package:dio/dio.dart';
import 'package:nusago_ems/core/network/api_endpoints.dart';

class DioClient {
  final Dio _dio;

  /*
  DioClient()
    : _dio = Dio(
        BaseOptions(
          baseUrl: ApiEndpoints
              .baseUrl, // Use the base URL defined in your endpoints file
          contentType: 'application/json',
          headers: {
            'Accept': 'application/json',
            // We will add Authorization header dynamically via interceptor
          },
        ),
      );
  */

  DioClient._internal() : _dio = Dio(BaseOptions(baseUrl: ApiEndpoints.baseUrl));

  factory DioClient() {
    return DioClient._internal();
  }

  /// Adds an Interceptor to automatically attach the Bearer token.
  void setupInterceptors(String? token) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Check if the request requires authentication and a token is available
          if (token != null && !options.path.contains('/api/register')) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (DioException e, handler) async {
          // Handle common API errors globally
          if (e.response != null) {
            final statusCode = e.response!.statusCode;
            if (statusCode == 401) {
              // Token expired or invalid - trigger logout/re-login flow
              print(
                'API Error: Unauthorized (401). User must re-authenticate.',
              );
              // TODO: Implement global state management to force user logout here.
            } else if (statusCode == 422) {
              // Validation error from Laravel FormRequest
              throw ServerFailure(
                e.response!.data['message'] ?? 'Validation failed.',
                statusCode: 422,
              );
            }
          }
          return handler.next(e); // Re-throw the exception for BLoC to catch
        },
      ),
    );
  }

  // --- Core Request Methods ---

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final options = Options(headers: {'Accept': 'application/json', 'Content-type': 'application/json'});
    return await _dio.get(
      path,
      options: options,
      queryParameters: queryParameters,
    );
  }

  Future<Response> post(
    String path, {
    required Map<String, dynamic> data,
    Options? options,
  }) async {
    final options = Options(headers: {'Accept': 'application/json', 'Content-type': 'application/json'});
    return await _dio.post(path, data: data, options: options);
  }

  Future<Response> put(
    String path, {
    required Map<String, dynamic> data,
    Options? options,
  }) async {
    final options = Options(headers: {'Accept': 'application/json', 'Content-type': 'application/json'});
    return await _dio.put(path, data: data, options: options);
  }

  Future<Response> delete(String path, {Options? options}) async {
    final options = Options(headers: {'Accept': 'application/json', 'Content-type': 'application/json'});
    return await _dio.delete(path, options: options);
  }
}
