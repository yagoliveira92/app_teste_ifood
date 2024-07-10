import 'package:app_teste_ifood/app/core/network/response_types/error/exceptions.dart';
import 'package:app_teste_ifood/app/core/network/response_types/error/response.dart';
import 'package:app_teste_ifood/app/core/network/response_types/success/success.dart';
import 'package:app_teste_ifood/app/features/auth/domain/use_cases/check_token_usecase.dart';
import 'package:app_teste_ifood/app/features/auth/domain/use_cases/login_usecase.dart';
import 'package:app_teste_ifood/app/features/auth/presentation/manager/login_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCheckTokenUsecase extends Mock implements CheckTokenUsecase {}

class MockLoginUsecase extends Mock implements LoginUsecase {}

void main() {
  late LoginCubit loginCubit;
  late MockCheckTokenUsecase mockCheckTokenUsecase;
  late MockLoginUsecase mockLoginUsecase;

  setUp(() {
    mockCheckTokenUsecase = MockCheckTokenUsecase();
    mockLoginUsecase = MockLoginUsecase();
    loginCubit = LoginCubit(
      checkTokenUsecase: mockCheckTokenUsecase,
      loginUsecase: mockLoginUsecase,
    );
  });

  tearDown(() {
    loginCubit.close();
  });

  group('CheckToken', () {
    blocTest<LoginCubit, LoginState>(
      'Deve emitir [LoginHasLogged] quando o token for válido',
      build: () {
        when(() => mockCheckTokenUsecase.call()).thenAnswer((_) async => true);
        return loginCubit;
      },
      act: (cubit) => cubit.checkToken(),
      expect: () => [isA<LoginHasLogged>()],
    );

    blocTest<LoginCubit, LoginState>(
      'Deve emitir [LoginHasNotLogged] quando o token for inválido',
      build: () {
        when(() => mockCheckTokenUsecase.call()).thenAnswer((_) async => false);
        return loginCubit;
      },
      act: (cubit) => cubit.checkToken(),
      expect: () => [isA<LoginHasNotLogged>()],
    );
  });

  group('Login', () {
    blocTest<LoginCubit, LoginState>(
      'Deve emitir [LoginLoading, LoginSuccess] quando o login for bem-sucedido',
      build: () {
        when(() => mockLoginUsecase.login(
              email: any(named: 'email'),
              password: any(named: 'password'),
            )).thenAnswer((_) async => Success());
        return loginCubit;
      },
      act: (cubit) =>
          cubit.login(email: 'test@email.com', password: 'password'),
      expect: () => [
        isA<LoginLoading>(),
        isA<LoginSuccess>(),
      ],
    );

    blocTest<LoginCubit, LoginState>(
      'Deve emitir [LoginLoading, LoginError] quando o login falhar com GeneralFailure',
      build: () {
        when(() => mockLoginUsecase.login(
              email: any(named: 'email'),
              password: any(named: 'password'),
            )).thenAnswer((_) async => GeneralFailure(message: 'Erro geral'));
        return loginCubit;
      },
      act: (cubit) =>
          cubit.login(email: 'test@email.com', password: 'password'),
      expect: () => [
        isA<LoginLoading>(),
        isA<LoginError>().having((e) => e.message, 'message', 'Erro geral')
      ],
    );

    blocTest<LoginCubit, LoginState>(
      'Deve emitir [LoginLoading, LoginError] quando o login falhar com NoConnectionException',
      build: () {
        when(() => mockLoginUsecase.login(
              email: any(named: 'email'),
              password: any(named: 'password'),
            )).thenAnswer((_) async => NoConnectionException());
        return loginCubit;
      },
      act: (cubit) =>
          cubit.login(email: 'test@email.com', password: 'password'),
      expect: () => [
        isA<LoginLoading>(),
        isA<LoginError>().having(
            (e) => e.message, 'message', NoConnectionException().message)
      ],
    );

    blocTest<LoginCubit, LoginState>(
      'Deve emitir [LoginLoading, LoginError] quando o login falhar com UnauthorizedException',
      build: () {
        when(() => mockLoginUsecase.login(
              email: any(named: 'email'),
              password: any(named: 'password'),
            )).thenAnswer((_) async => UnauthorizedException());
        return loginCubit;
      },
      act: (cubit) =>
          cubit.login(email: 'test@email.com', password: 'password'),
      expect: () => [
        isA<LoginLoading>(),
        isA<LoginError>().having(
            (e) => e.message, 'message', NoConnectionException().message)
      ],
    );
  });
}
