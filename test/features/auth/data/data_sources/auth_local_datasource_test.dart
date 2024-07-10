import 'package:app_teste_ifood/app/core/storage_adapter/secure_storage/secure_storage_service.dart';
import 'package:app_teste_ifood/app/features/auth/data/data_sources/auth_local_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSecureStorageService extends Mock implements SecureStorageService {}

void main() {
  late AuthLocalDatasource authLocalDatasource;
  late MockSecureStorageService mockSecureStorageService;

  setUp(() {
    mockSecureStorageService = MockSecureStorageService();
    authLocalDatasource =
        AuthLocalDatasource(secureStorageService: mockSecureStorageService);
  });

  group('saveToken', () {
    test(
        'Deve chamar o método write do SecureStorageService com os valores corretos',
        () async {
      const token = 'test_token';
      when(() => mockSecureStorageService.write(any(), any()))
          .thenAnswer((_) async => () {});
      await authLocalDatasource.savaToken(token);
      verify(() => mockSecureStorageService.write('token', token)).called(1);
    });
  });

  group('checkToken', () {
    test(
        'Deve chamar o método read do SecureStorageService com a chave correta',
        () async {
      when(() => mockSecureStorageService.read('token'))
          .thenAnswer((_) async => 'test_token');
      final result = await authLocalDatasource.checkToken();
      expect(result, 'test_token');
      verify(() => mockSecureStorageService.read('token')).called(1);
    });

    test('Deve retornar null quando o token não for encontrado', () async {
      when(() => mockSecureStorageService.read('token'))
          .thenAnswer((_) async => null);
      final result = await authLocalDatasource.checkToken();
      expect(result, null);
      verify(() => mockSecureStorageService.read('token')).called(1);
    });
  });
}
