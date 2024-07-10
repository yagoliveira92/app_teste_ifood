import 'package:app_teste_ifood/app/core/network/response_types/error/exceptions.dart';
import 'package:app_teste_ifood/app/core/network/response_types/error/response.dart';
import 'package:app_teste_ifood/app/core/network/response_types/success/success.dart';
import 'package:app_teste_ifood/app/core/remote_adapter/models/remote_data.dart';
import 'package:app_teste_ifood/app/features/auth/data/data_sources/auth_local_datasource.dart';
import 'package:app_teste_ifood/app/features/auth/data/data_sources/auth_remote_datasource.dart';
import 'package:app_teste_ifood/app/features/auth/data/repositories/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRemoteDataSource extends Mock implements IAuthRemoteDataSource {}

class MockAuthLocalDatasource extends Mock implements IAuthLocalDatasource {}

void main() {
  late AuthRepository authRepository;
  late MockAuthRemoteDataSource mockAuthRemoteDataSource;
  late MockAuthLocalDatasource mockAuthLocalDatasource;

  setUp(() {
    mockAuthRemoteDataSource = MockAuthRemoteDataSource();
    mockAuthLocalDatasource = MockAuthLocalDatasource();
    authRepository = AuthRepository(
      authRemoteDataSource: mockAuthRemoteDataSource,
      authLocalDatasource: mockAuthLocalDatasource,
    );
  });

  group('login', () {
    test('Deve retornar Success quando o login for bem sucedido', () async {
      when(() => mockAuthRemoteDataSource.login(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenAnswer((_) async => RemoteData(
            data: {'token': 'test_token'},
            statusCode: 200,
            noConnection: false,
          ));

      when(() => mockAuthLocalDatasource.savaToken('test_token'))
          .thenAnswer((_) async {});

      final result = await authRepository.login(
        email: 'test@email.com',
        password: 'password',
      );

      expect(result, isA<Success>());
      verify(() => mockAuthLocalDatasource.savaToken('test_token')).called(1);
    });

    test('Deve retornar NoConnectionException quando não houver conexão',
        () async {
      when(() => mockAuthRemoteDataSource.login(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenAnswer((_) async => RemoteData(
            data: null,
            statusCode: 0,
            noConnection: true,
          ));

      final result = await authRepository.login(
        email: 'test@email.com',
        password: 'password',
      );

      expect(result, isA<NoConnectionException>());
    });

    test(
        'Deve retornar UnauthorizedException quando as credenciais forem inválidas',
        () async {
      when(() => mockAuthRemoteDataSource.login(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenAnswer((_) async => RemoteData(
            data: null,
            statusCode: 401,
            noConnection: false,
          ));

      final result = await authRepository.login(
        email: 'test@email.com',
        password: 'password',
      );

      expect(result, isA<UnauthorizedException>());
    });

    test('Deve retornar GeneralFailure quando ocorrer um erro geral', () async {
      when(() => mockAuthRemoteDataSource.login(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenAnswer((_) async => RemoteData(
            data: {'error': 'Erro geral'},
            statusCode: 500,
            noConnection: false,
          ));

      final result = await authRepository.login(
        email: 'test@email.com',
        password: 'password',
      );

      expect(result, isA<GeneralFailure>());
      expect((result as GeneralFailure).message, contains('Erro geral'));
    });

    test('Deve retornar GeneralFailure quando ocorrer uma exceção', () async {
      when(() => mockAuthRemoteDataSource.login(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenThrow(Exception('Erro de teste'));

      final result = await authRepository.login(
        email: 'test@email.com',
        password: 'password',
      );

      expect(result, isA<GeneralFailure>());
      expect((result as GeneralFailure).message,
          contains('Exception: Erro de teste'));
    });
  });

  group('checkToken', () {
    test('Deve retornar true quando o token existir e for válido', () async {
      when(() => mockAuthLocalDatasource.checkToken())
          .thenAnswer((_) async => 'test_token');

      final result = await authRepository.checkToken();

      expect(result, true);
    });

    test('Deve retornar false quando o token não existir', () async {
      when(() => mockAuthLocalDatasource.checkToken())
          .thenAnswer((_) async => null);

      final result = await authRepository.checkToken();

      expect(result, false);
    });

    test('Deve retornar false quando o token estiver vazio', () async {
      when(() => mockAuthLocalDatasource.checkToken())
          .thenAnswer((_) async => '');

      final result = await authRepository.checkToken();

      expect(result, false);
    });
  });
}
