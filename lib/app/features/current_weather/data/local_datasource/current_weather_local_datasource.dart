import 'package:app_teste_ifood/app/core/storage_adapter/local_database/manager/i_local_data_manager.dart';
import 'package:app_teste_ifood/app/core/storage_adapter/local_database/models/local_data.dart';
import 'package:app_teste_ifood/app/features/current_weather/data/models/current_weather_model.dart';

abstract class ICurrentWeatherLocalDataSource {
  Future<LocalData> getCurrentWeather(CurrentWeatherModel currentWeather);
  Future<void> saveCurrentWeather(CurrentWeatherModel currentWeather);
}

class CurrentWeatherLocalDataSource implements ICurrentWeatherLocalDataSource {
  const CurrentWeatherLocalDataSource({
    required this.localDataManager,
  });

  final ILocalDataManager localDataManager;

  @override
  Future<LocalData> getCurrentWeather(String cityName) async {
    return await localDataManager.get(store: 'current_weather_$cityName');
  }

  @override
  Future<void> saveCurrentWeather(

  ) async {
    return await localDataManager.eraseAndAdd(
      store: 'current_weather_$cityName',
      data: data,
    );
  }
}
