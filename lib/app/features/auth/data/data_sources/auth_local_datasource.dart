import 'package:app_teste_ifood/app/core/storage_adapter/secure_storage_service.dart';

abstract class IAuthLocalDatasource {
  Future<void> savaToken(String token);
}

class AuthLocalDatasource implements IAuthLocalDatasource {
  AuthLocalDatasource({
    required this.secureStorageService,
  });

  final SecureStorageService secureStorageService;
  @override
  Future<void> savaToken(String token) async {
    return await secureStorageService.write('token', token);
  }
}
