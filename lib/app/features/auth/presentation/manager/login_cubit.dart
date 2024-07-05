import 'package:app_teste_ifood/app/core/network/response_types/error/exceptions.dart';
import 'package:app_teste_ifood/app/core/network/response_types/error/response.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:app_teste_ifood/app/core/network/response_types/success/success.dart';
import 'package:app_teste_ifood/app/features/auth/domain/use_cases/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginUsecase}) : super(LoginInitial());

  final LoginUsecase loginUsecase;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    final response = await loginUsecase.login(email: email, password: password);
    if (response is Success) {
      emit(LoginSuccess());
    } else if (response is GeneralFailure) {
      emit(LoginError(response.message));
    } else if (response is NoConnectionException) {
      emit(LoginError(NoConnectionException().message));
    } else if (response is UnauthorizedException) {
      emit(LoginError(NoConnectionException().message));
    }
  }
}
