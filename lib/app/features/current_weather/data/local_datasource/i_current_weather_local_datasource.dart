import 'package:app_teste_ifood/app/core/storage_adapter/local_database/models/local_data.dart';

abstract class ICurrentWeatherLocalDataSource {
  Future<LocalData> getCurrentWeather(String cityName);
  Future<void> saveCurrentWeather(String cityName, Map<String, dynamic> data);
}
