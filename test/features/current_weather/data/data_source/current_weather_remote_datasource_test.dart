import 'package:app_teste_ifood/app/core/remote_adapter/manager/i_remote_data_manager.dart';
import 'package:app_teste_ifood/app/core/remote_adapter/models/endpoint.dart';
import 'package:app_teste_ifood/app/core/remote_adapter/models/methods_enum.dart';
import 'package:app_teste_ifood/app/core/remote_adapter/models/remote_data.dart';
import 'package:app_teste_ifood/app/features/current_weather/data/remote_datasource/current_weather_remote_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRemoteDataManager extends Mock implements IRemoteDataManager {}

void main() {
  late CurrentWeatherRemoteDataSource currentWeatherRemoteDataSource;
  late MockRemoteDataManager mockRemoteDataManager;

  setUpAll(() {
    registerFallbackValue(Endpoint(
      method: Methods.get,
      query: {
        'units': 'metric',
      },
      path: '/weather?q=aracaju',
    ));
  });

  setUp(() {
    mockRemoteDataManager = MockRemoteDataManager();
    currentWeatherRemoteDataSource = CurrentWeatherRemoteDataSource(
      remoteDataManager: mockRemoteDataManager,
    );
  });

  group('getCurrentWeather', () {
    test(
        'Deve chamar o método request do RemoteDataManager com o endpoint correto',
        () async {
      when(
        () => mockRemoteDataManager.request(
          endpoint: any(named: 'endpoint'),
        ),
      ).thenAnswer((_) async => RemoteData(data: {}));

      await currentWeatherRemoteDataSource.getCurrentWeather(city: 'Aracaju');

      verify(() =>
              mockRemoteDataManager.request(endpoint: any(named: 'endpoint')))
          .called(1);
    });

    test('Deve retornar RemoteData com os dados corretos', () async {
      final data = {'temp': 25, 'description': 'Ensolarado'};

      when(() =>
              mockRemoteDataManager.request(endpoint: any(named: 'endpoint')))
          .thenAnswer((_) async => RemoteData(data: data));

      final result = await currentWeatherRemoteDataSource.getCurrentWeather(
          city: 'Aracaju');

      expect(result.data, data);
    });
  });
}
