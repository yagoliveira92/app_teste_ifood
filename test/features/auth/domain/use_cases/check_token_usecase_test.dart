import 'package:app_teste_ifood/app/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:app_teste_ifood/app/features/auth/domain/use_cases/check_token_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  late CheckTokenUsecase checkTokenUsecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    checkTokenUsecase = CheckTokenUsecase(authRepository: mockAuthRepository);
  });

  group('CheckTokenUsecase', () {
    test('Deve retornar true quando o token for válido', () async {
      when(() => mockAuthRepository.checkToken()).thenAnswer((_) async => true);

      final result = await checkTokenUsecase();

      expect(result, true);
      verify(() => mockAuthRepository.checkToken()).called(1);
    });

    test('Deve retornar false quando otoken for inválido', () async {
      when(() => mockAuthRepository.checkToken())
          .thenAnswer((_) async => false);

      final result = await checkTokenUsecase();

      expect(result, false);
      verify(() => mockAuthRepository.checkToken()).called(1);
    });
  });
}
