import 'package:app_teste_ifood/app/core/network/response_types/error/i_response.dart';
import 'package:app_teste_ifood/app/features/auth/data/repositories/auth_repository.dart';

class LoginUsecase {
  LoginUsecase({required this.authRepository});

  final AuthRepository authRepository;

  Future<Response> login(
      {required String email, required String password}) async {
    return await authRepository.login(email: email, password: password);
  }
}
