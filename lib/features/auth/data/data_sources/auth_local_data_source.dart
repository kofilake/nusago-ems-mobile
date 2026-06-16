import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthLocalDataSource {
  final FlutterSecureStorage secureStorage;
  static const String tokenKey = 'CACHED_AUTH_TOKEN';

  AuthLocalDataSource({required this.secureStorage});

  Future<void> cacheToken(String token) async {
    await secureStorage.write(key: tokenKey, value: token);
  }

  Future<String?> getToken() async {
    return await secureStorage.read(key: tokenKey);
  }

  Future<void> clearToken() async {
    await secureStorage.delete(key: tokenKey);
  }
}
