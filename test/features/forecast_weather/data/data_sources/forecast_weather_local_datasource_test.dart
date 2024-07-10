import 'package:app_teste_ifood/app/core/storage_adapter/local_database/manager/i_local_data_manager.dart';
import 'package:app_teste_ifood/app/core/storage_adapter/local_database/models/local_data.dart';
import 'package:app_teste_ifood/app/features/forecast_weather/data/data_sources/local_datasource/forecast_weather_local_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLocalDataManager extends Mock implements ILocalDataManager {}

void main() {
  late ForecastWeatherLocalDataSource forecastWeatherLocalDataSource;
  late MockLocalDataManager mockLocalDataManager;
  setUp(() {
    mockLocalDataManager = MockLocalDataManager();
    forecastWeatherLocalDataSource = ForecastWeatherLocalDataSource(
      localDataManager: mockLocalDataManager,
    );
  });

  group('getForecastWeather', () {
    test('Deve chamar o método get do LocalDataManager com a chave correta',
        () async {
      const cityName = 'São Paulo';
      when(() => mockLocalDataManager.get(store: 'forecast_weather_$cityName'))
          .thenAnswer((_) async => LocalData(data: {}));

      await forecastWeatherLocalDataSource.getForecastWeather(cityName);

      verify(() =>
              mockLocalDataManager.get(store: 'forecast_weather_$cityName'))
          .called(1);
    });

    test('Deve retornar LocalData com os dados corretos', () async {
      const cityName = 'São Paulo';
      const data = {'list': []};
      when(() => mockLocalDataManager.get(store: 'forecast_weather_$cityName'))
          .thenAnswer((_) async => LocalData(data: data));

      final result =
          await forecastWeatherLocalDataSource.getForecastWeather(cityName);

      expect(result.data, data);
    });
  });

  group('saveForecastWeather', () {
    test(
        'Deve chamar o método eraseAndAdd do LocalDataManager com a chave e os dados corretos',
        () async {
      const cityName = 'São Paulo';
      const data = {'list': []}; // Substitua com a estrutura de dados esperada
      when(() => mockLocalDataManager.eraseAndAdd(
            store: 'forecast_weather_$cityName',
            data: data,
          )).thenAnswer((_) async {});

      await forecastWeatherLocalDataSource.saveForecastWeather(cityName, data);

      verify(() => mockLocalDataManager.eraseAndAdd(
            store: 'forecast_weather_$cityName',
            data: data,
          )).called(1);
    });
  });
}
