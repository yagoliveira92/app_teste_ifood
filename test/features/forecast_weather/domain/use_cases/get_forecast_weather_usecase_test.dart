import 'package:app_teste_ifood/app/core/network/response_types/error/response.dart';
import 'package:app_teste_ifood/app/core/network/response_types/success/success.dart';
import 'package:app_teste_ifood/app/features/forecast_weather/domain/entities/forecast_weather_entity.dart';
import 'package:app_teste_ifood/app/features/forecast_weather/domain/repositories/i_forecast_weather_repository.dart';
import 'package:app_teste_ifood/app/features/forecast_weather/domain/use_cases/get_forecast_weather_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockForecastWeatherRepository extends Mock
    implements IForecastWeatherRepository {}

void main() {
  late GetForecastWeatherUseCase useCase;
  late MockForecastWeatherRepository repository;

  const tMock = ForecastWeatherEntity();

  setUp(() {
    repository = MockForecastWeatherRepository();
    useCase = GetForecastWeatherUseCase(repository: repository);
  });
  group('Obter dados do GetForecastWeather (UserCase)', () {
    test('Sucesso ao obter os dados do Forecast Weather', () async {
      when(() => repository.getForecastWeather(city: any(named: 'city')))
          .thenAnswer(
        (_) async =>
            (forecastWeather: const ForecastWeatherEntity(), result: Success()),
      );
      final result = await useCase('aracaju');
      expect(result.forecastWeather, tMock);
      expect(result.result, isA<Success>());
    });

    test('Falha ao obter os dados do Current Weather', () async {
      when(() => repository.getForecastWeather(city: any(named: 'city')))
          .thenAnswer(
        (_) async => (
          forecastWeather: const ForecastWeatherEntity(),
          result: GeneralFailure()
        ),
      );
      final result = await useCase('aracaju');
      expect(result.forecastWeather, const ForecastWeatherEntity());
      expect(result.result, isA<GeneralFailure>());
    });
  });
}
