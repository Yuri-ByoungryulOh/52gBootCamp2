import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:simple_webapp/app/core/constants/common_constants.dart';

class SecureStorageService {
  SecureStorageService() {
    init();
  }

  final _storage = const FlutterSecureStorage();

  String accessToken = '';
  String loginedUserId = '';
  bool get hasToken => accessToken.isNotEmpty;

  Future<SecureStorageService> init() async {
    accessToken = await _storage.read(key: CommonConstants.jwtTokenKey) ?? '';
    loginedUserId = await _storage.read(key: CommonConstants.loginedUserId) ?? '';
    return this;
  }

  Future<void> deleteAll() async {
    accessToken = '';
    loginedUserId = '';
    await _storage.deleteAll();
  }

  Future<void> write({required String key, required String? value}) async {
    await _storage.write(key: key, value: value);

    switch (key) {
      case CommonConstants.jwtTokenKey:
        accessToken = await _storage.read(key: CommonConstants.jwtTokenKey) ?? '';
        break;
      case CommonConstants.loginId:
        loginedUserId = await _storage.read(key: CommonConstants.loginedUserId) ?? '';
        break;
      default:
    }
  }

  Future<void> delete(String key) async {
    await _storage.delete(key: key);
    if (key == CommonConstants.jwtTokenKey || key == CommonConstants.loginedUserId) {
      accessToken = '';
      loginedUserId = '';
    }
  }

  Future<String?> read({required String key}) async => _storage.read(key: key);
}