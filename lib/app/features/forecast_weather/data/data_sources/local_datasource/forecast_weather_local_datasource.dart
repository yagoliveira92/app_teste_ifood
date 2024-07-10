import 'package:app_teste_ifood/app/core/storage_adapter/local_database/manager/i_local_data_manager.dart';
import 'package:app_teste_ifood/app/core/storage_adapter/local_database/models/local_data.dart';

abstract class IForecastWeatherLocalDataSource {
  Future<LocalData> getForecastWeather(String cityName);

  Future<void> saveForecastWeather(String cityName, Map<String, dynamic> data);
}

class ForecastWeatherLocalDataSource
    implements IForecastWeatherLocalDataSource {
  const ForecastWeatherLocalDataSource({
    required this.localDataManager,
  });

  final ILocalDataManager localDataManager;

  @override
  Future<LocalData> getForecastWeather(String cityName) async {
    return await localDataManager.get(store: 'forecast_weather_$cityName');
  }

  @override
  Future<void> saveForecastWeather(
    String cityName,
    Map<String, dynamic> data,
  ) async {
    return await localDataManager.eraseAndAdd(
      store: 'forecast_weather_$cityName',
      data: data,
    );
  }
}
