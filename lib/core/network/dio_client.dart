// lib/core/network/dio_client.dart
import '/core/error/failure.dart';
import 'package:dio/dio.dart';
import 'package:nusago_ems/core/network/api_endpoints.dart';

class DioClient {
  final Dio _dio;
  String? _token;
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
  static final DioClient _instance = DioClient._internal();
  DioClient._internal()
    : _dio = Dio(BaseOptions(baseUrl: ApiEndpoints.baseUrl)) {
    setupInterceptors();
  }

  factory DioClient() {
    return _instance;
  }

  void updateToken(String? newToken) {
    _token = newToken;
  }

  /// Adds an Interceptor to automatically attach the Bearer token.
  void setupInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Check if the request requires authentication and a token is available
          if (_token != null && !options.path.contains('/api/register')) {
            options.headers['Authorization'] = 'Bearer $_token';
          }
          return handler.next(options);
        },
        onError: (DioException e, handler) async {
          if (e.type == DioExceptionType.badResponse) {
            if (e.response?.statusCode == 422) {
              throw ServerFailure(
                e.response!.data['message'] ?? 'Validation failed.',
                statusCode: 422,
              );
            }
            return handler.next(e); // Re-throw the exception for BLoC to catch
          }
        },
      ),
    );
  }

  // --- Core Request Methods ---

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final options = Options(
      headers: {
        'Accept': 'application/json',
        'Content-type': 'application/json',
      },
    );
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
    final options = Options(
      headers: {
        'Accept': 'application/json',
        'Content-type': 'application/json',
      },
    );
    return await _dio.post(path, data: data, options: options);
  }

  Future<Response> put(
    String path, {
    required Map<String, dynamic> data,
    Options? options,
  }) async {
    final options = Options(
      headers: {
        'Accept': 'application/json',
        'Content-type': 'application/json',
      },
    );
    return await _dio.put(path, data: data, options: options);
  }

  Future<Response> delete(String path, {Options? options}) async {
    final options = Options(
      headers: {
        'Accept': 'application/json',
        'Content-type': 'application/json',
      },
    );
    return await _dio.delete(path, options: options);
  }
}
