import 'package:app_teste_ifood/app/core/network/error/response.dart';

abstract class IAuthRepository {
  Future<Response> login({required String email, required String password});
  Future<void> forgotPassword({required String email});
}
