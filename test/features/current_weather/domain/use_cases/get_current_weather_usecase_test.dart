import 'package:app_teste_ifood/app/core/network/response_types/error/response.dart';
import 'package:app_teste_ifood/app/core/network/response_types/success/success.dart';
import 'package:app_teste_ifood/app/features/current_weather/domain/entities/current_weather_entity.dart';
import 'package:app_teste_ifood/app/features/current_weather/domain/repositories/i_current_weather_repository.dart';
import 'package:app_teste_ifood/app/features/current_weather/domain/use_cases/get_current_weather_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCurrentWeatherRepository extends Mock
    implements ICurrentWeatherRepository {}

void main() {
  late GetCurrentWeatherUseCase useCase;
  late MockCurrentWeatherRepository repository;

  final listCurrent = <CurrentWeatherEntity>[
    const CurrentWeatherEntity(),
    const CurrentWeatherEntity(),
    const CurrentWeatherEntity(),
    const CurrentWeatherEntity(),
  ];

  setUp(() {
    repository = MockCurrentWeatherRepository();
    useCase = GetCurrentWeatherUseCase(repository: repository);
  });
  group('Obter dados da Previsão do Tempo Atual das Cidades (UserCase)', () {
    test('Sucesso ao obter os dados do Current Weather', () async {
      when(() => repository.getCurrentWeather(city: any(named: 'city')))
          .thenAnswer(
        (_) async =>
            (currentWeather: const CurrentWeatherEntity(), result: Success()),
      );
      final result = await useCase();
      expect(result.currentWeatherList, listCurrent);
      expect(result.result, isA<Success>());
      expect(result.currentWeatherList.length, 4);
    });

    test('Falha ao obter os dados do Current Weather', () async {
      when(() => repository.getCurrentWeather(city: any(named: 'city')))
          .thenAnswer(
        (_) async => (
          currentWeather: const CurrentWeatherEntity(),
          result: GeneralFailure()
        ),
      );
      final result = await useCase();
      expect(result.currentWeatherList, <CurrentWeatherEntity>[]);
      expect(result.result, isA<GeneralFailure>());
      expect(result.currentWeatherList.length, 0);
    });
  });
}
