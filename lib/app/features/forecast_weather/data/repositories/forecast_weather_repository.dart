import 'package:app_teste_ifood/app/core/network/response_types/error/i_response.dart';
import 'package:app_teste_ifood/app/core/network/response_types/error/response.dart';
import 'package:app_teste_ifood/app/core/network/response_types/success/success.dart';
import 'package:app_teste_ifood/app/features/forecast_weather/data/data_sources/local_datasource/forecast_weather_local_datasource.dart';
import 'package:app_teste_ifood/app/features/forecast_weather/data/data_sources/remote_datasource/forecast_weather_remote_datasource.dart';
import 'package:app_teste_ifood/app/features/forecast_weather/data/models/forecast_weather_model.dart';
import 'package:app_teste_ifood/app/features/forecast_weather/domain/entities/forecast_weather_entity.dart';
import 'package:app_teste_ifood/app/features/forecast_weather/domain/repositories/i_forecast_weather_repository.dart';

class ForecastWeatherRepository implements IForecastWeatherRepository {
  final IForecastWeatherRemoteDataSource remoteDataSource;
  final IForecastWeatherLocalDataSource localDataSource;

  ForecastWeatherRepository({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<({Response result, ForecastWeatherEntity forecastWeather})>
      getForecastWeather({required String city}) async {
    try {
      final response = await remoteDataSource.getForecastWeather(city: city);
      if (response.isSuccess) {
        final forecastWeather = ForecastWeatherModel.fromJson(response.data);
        await localDataSource.saveForecastWeather(city, response.data);
        return (result: Success(), forecastWeather: forecastWeather);
      }
      if (response.noConnection) {
        final localData = await localDataSource.getForecastWeather(city);
        if (localData.hasData) {
          final forecastWeather = ForecastWeatherModel.fromJson(localData.data);
          return (
            result: Success(hasConnection: false),
            forecastWeather: forecastWeather
          );
        }
      }
      return (
        result: GeneralFailure(),
        forecastWeather: const ForecastWeatherEntity()
      );
    } catch (e) {
      return (
        result: GeneralFailure(),
        forecastWeather: const ForecastWeatherEntity()
      );
    }
  }
}
