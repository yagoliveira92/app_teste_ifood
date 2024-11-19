import 'dart:async';
import 'dart:io';
import 'package:app_teste_ifood/app/core/containers/injection_container.dart';
import 'package:app_teste_ifood/app/core/storage_adapter/secure_storage/secure_storage_service.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/models/interceptor_contract.dart';

class TokenInterceptor extends InterceptorContract {
  TokenInterceptor({
    SecureStorageService? secureStorageService,
  }) : _storageService =
            secureStorageService ?? dependency.get<SecureStorageService>();

  final SecureStorageService? _storageService;

  @override
  Future<BaseRequest> interceptRequest({
    required BaseRequest request,
  }) async {
    final token = await _storageService!.read('token') ?? '';
    if (token.isNotEmpty) {
      request.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    }
    print('----- Request -----');
    print(request.toString());
    print(request.headers.toString());
    return request;
  }

  @override
  FutureOr<BaseResponse> interceptResponse({required BaseResponse response}) {
    return response;
  }
}
