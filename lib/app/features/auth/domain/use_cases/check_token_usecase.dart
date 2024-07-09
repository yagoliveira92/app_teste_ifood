import 'package:app_teste_ifood/app/features/auth/domain/repositories/i_auth_repository.dart';

class CheckTokenUsecase {
  final IAuthRepository authRepository;

  CheckTokenUsecase({required this.authRepository});

  Future<bool> call() async {
    return await authRepository.checkToken();
  }
}
