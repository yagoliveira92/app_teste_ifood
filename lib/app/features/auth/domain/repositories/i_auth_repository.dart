import 'package:app_teste_ifood/app/core/network/response_types/error/i_response.dart';

abstract class IAuthRepository {
  Future<Response> login({required String email, required String password});
  Future<bool> checkToken();
}
