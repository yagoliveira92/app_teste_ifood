import 'package:app_teste_ifood/app/core/network/response_types/error/exceptions.dart';
import 'package:app_teste_ifood/app/core/network/response_types/error/response.dart';
import 'package:app_teste_ifood/app/core/network/response_types/success/success.dart';
import 'package:app_teste_ifood/app/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:app_teste_ifood/app/features/auth/domain/use_cases/login_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  late LoginUsecase loginUsecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    loginUsecase = LoginUsecase(authRepository: mockAuthRepository);
  });

  group('LoginUsecase', () {
    test('Deve retornar Success quando o login for bem sucedido', () async {
      when(() => mockAuthRepository.login(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenAnswer((_) async => Success());

      final result = await loginUsecase.login(
        email: 'test@email.com',
        password: 'password',
      );

      expect(result, isA<Success>());
      verify(() => mockAuthRepository.login(
            email: 'test@email.com',
            password: 'password',
          )).called(1);
    });

    test('Deve retornar NoConnectionException quando não houver conexão',
        () async {
      when(() => mockAuthRepository.login(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenAnswer((_) async => NoConnectionException());

      final result = await loginUsecase.login(
        email: 'test@email.com',
        password: 'password',
      );

      expect(result, isA<NoConnectionException>());
      verify(() => mockAuthRepository.login(
            email: 'test@email.com',
            password: 'password',
          )).called(1);
    });

    test(
        'Deve retornar UnauthorizedException quando as credenciais forem inválidas',
        () async {
      when(() => mockAuthRepository.login(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenAnswer((_) async => UnauthorizedException());

      final result = await loginUsecase.login(
        email: 'test@email.com',
        password: 'password',
      );

      expect(result, isA<UnauthorizedException>());
      verify(() => mockAuthRepository.login(
            email: 'test@email.com',
            password: 'password',
          )).called(1);
    });

    test('Deve retornar GeneralFailure quando ocorrer um erro geral', () async {
      when(() => mockAuthRepository.login(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenAnswer((_) async => GeneralFailure(message: 'Erro geral'));

      final result = await loginUsecase.login(
        email: 'test@email.com',
        password: 'password',
      );

      expect(result, isA<GeneralFailure>());
      verify(() => mockAuthRepository.login(
            email: 'test@email.com',
            password: 'password',
          )).called(1);
    });
  });
}
