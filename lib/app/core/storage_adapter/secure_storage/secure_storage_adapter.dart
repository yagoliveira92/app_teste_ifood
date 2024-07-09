import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:app_teste_ifood/app/core/storage_adapter/secure_storage/secure_storage_service.dart';

class SecureStorageAdapter implements SecureStorageService {
  final _secureStorage = const FlutterSecureStorage();
  @override
  Future<String> read(String key) async {
    final data = await _secureStorage.read(key: key);
    if (data != null) {
      return data;
    } else {
      return '';
    }
  }

  @override
  Future<void> write(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  @override
  Future<void> delete(String key) async {
    await _secureStorage.delete(key: key);
  }

  @override
  Future<bool> check(String key) async {
    return await _secureStorage.containsKey(key: key);
  }
}
