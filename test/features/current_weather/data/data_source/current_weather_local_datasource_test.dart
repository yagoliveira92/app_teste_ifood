import 'package:app_teste_ifood/app/core/storage_adapter/local_database/manager/i_local_data_manager.dart';
import 'package:app_teste_ifood/app/core/storage_adapter/local_database/models/local_data.dart';
import 'package:app_teste_ifood/app/features/current_weather/data/local_datasource/current_weather_local_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLocalDataManager extends Mock implements ILocalDataManager {}

void main() {
  late CurrentWeatherLocalDataSource currentWeatherLocalDataSource;
  late MockLocalDataManager mockLocalDataManager;
  setUp(() {
    mockLocalDataManager = MockLocalDataManager();
    currentWeatherLocalDataSource = CurrentWeatherLocalDataSource(
      localDataManager: mockLocalDataManager,
    );
  });

  group('getCurrentWeather', () {
    test('Deve chamar o método get do LocalDataManager com a chave correta',
        () async {
      const cityName = 'São Paulo';
      when(() => mockLocalDataManager.get(store: 'current_weather_$cityName'))
          .thenAnswer((_) async => LocalData(data: {}));

      await currentWeatherLocalDataSource.getCurrentWeather(cityName);

      verify(() => mockLocalDataManager.get(store: 'current_weather_$cityName'))
          .called(1);
    });

    test('Deve retornar LocalData com os dados corretos', () async {
      const cityName = 'São Paulo';
      const data = {'temp': 25, 'description': 'Ensolarado'};
      when(() => mockLocalDataManager.get(store: 'current_weather_$cityName'))
          .thenAnswer((_) async => LocalData(data: data));

      final result =
          await currentWeatherLocalDataSource.getCurrentWeather(cityName);

      expect(result.data, data);
    });
  });

  group('saveCurrentWeather', () {
    test(
        'Deve chamar o método eraseAndAdd do LocalDataManager com a chave e os dados corretos',
        () async {
      const cityName = 'São Paulo';
      const data = {'temp': 25, 'description': 'Ensolarado'};
      when(() => mockLocalDataManager.eraseAndAdd(
            store: 'current_weather_$cityName',
            data: data,
          )).thenAnswer((_) async {});

      await currentWeatherLocalDataSource.saveCurrentWeather(cityName, data);

      verify(() => mockLocalDataManager.eraseAndAdd(
            store: 'current_weather_$cityName',
            data: data,
          )).called(1);
    });
  });
}
