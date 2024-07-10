import 'package:app_teste_ifood/app/core/remote_adapter/manager/i_remote_data_manager.dart';
import 'package:app_teste_ifood/app/features/auth/data/data_sources/auth_remote_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRemoteDataManager extends Mock implements IRemoteDataManager {}

void main() {
  late AuthRemoteDataSource authRemoteDataSource;
  late MockRemoteDataManager mockRemoteDataManager;

  setUp(() {
    mockRemoteDataManager = MockRemoteDataManager();
    authRemoteDataSource =
        AuthRemoteDataSource(remoteDataManager: mockRemoteDataManager);
  });

  group('login', () {
    test('Deve retornar RemoteData com token quando login for bem sucedido',
        () async {
      final result = await authRemoteDataSource.login(
        email: 'test@email.com',
        password: 'password',
      );

      expect(result.data, contains('token'));
      expect(result.statusCode, 200);
      expect(result.noConnection, false);
    });

    test('Deve retornar RemoteData com token quando login for bem sucedido',
        () async {
      final result = await authRemoteDataSource.login(
        email: 'test@email.com',
        password: 'password',
      );

      expect(result.data, contains('token'));
      expect(result.statusCode, 200);
      expect(result.noConnection, false);
    });

    test('Deve retornar RemoteData com token quando login for bem sucedido',
        () async {
      final result = await authRemoteDataSource.login(
        email: 'test@email.com',
        password: 'password',
      );

      expect(result.data, contains('token'));
      expect(result.statusCode, 200);
      expect(result.noConnection, false);
    });
  });

  group('forgotPassword', () {
    test('Deve lançar UnimplementedError', () {
      expect(
        () => authRemoteDataSource.forgotPassword(email: 'test@email.com'),
        throwsUnimplementedError,
      );
    });
  });
}
