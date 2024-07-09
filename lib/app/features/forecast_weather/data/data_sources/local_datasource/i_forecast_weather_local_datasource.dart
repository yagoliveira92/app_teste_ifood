import 'package:app_teste_ifood/app/core/storage_adapter/local_database/models/local_data.dart';

abstract class IForecastWeatherLocalDataSource {
  Future<LocalData> getForecastWeather(String cityName);

  Future<void> saveForecastWeather(String cityName, Map<String, dynamic> data);
}
