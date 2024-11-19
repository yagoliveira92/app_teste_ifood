import 'package:app_teste_ifood/app/core/network/response_types/error/i_response.dart';
import 'package:app_teste_ifood/app/core/network/response_types/error/response.dart';
import 'package:app_teste_ifood/app/core/network/response_types/success/success.dart';
import 'package:app_teste_ifood/app/features/current_weather/data/local_datasource/current_weather_local_datasource.dart';
import 'package:app_teste_ifood/app/features/current_weather/data/models/current_weather_model.dart';
import 'package:app_teste_ifood/app/features/current_weather/data/remote_datasource/current_weather_remote_datasource.dart';
import 'package:app_teste_ifood/app/features/current_weather/domain/entities/current_weather_entity.dart';
import 'package:app_teste_ifood/app/features/current_weather/domain/repositories/i_current_weather_repository.dart';
import 'package:flutter/foundation.dart';

class CurrentWeatherRepository implements ICurrentWeatherRepository {
  final ICurrentWeatherRemoteDataSource remoteDataSource;
  final ICurrentWeatherLocalDataSource localDataSource;

  CurrentWeatherRepository({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<({Response result, CurrentWeatherEntity currentWeather})>
      getCurrentWeather({required String city}) async {
    try {
      final response = await remoteDataSource.getCurrentWeather(city: city);
      if (response.isSuccess) {
        final currentWeather = CurrentWeatherModel.fromJson(response.data);
        if (!kIsWeb) {
          await localDataSource.saveCurrentWeather(city, response.data);
        }
        return (result: Success(), currentWeather: currentWeather);
      }
      if (response.noConnection) {
        final localData = await localDataSource.getCurrentWeather(city);
        if (localData.hasData) {
          final currentWeather = CurrentWeatherModel.fromJson(localData.data);
          return (
            result: Success(
              hasConnection: false,
            ),
            currentWeather: currentWeather
          );
        }
      }
      return (
        result: GeneralFailure(),
        currentWeather: const CurrentWeatherEntity()
      );
    } catch (e) {
      return (
        result: GeneralFailure(),
        currentWeather: const CurrentWeatherEntity()
      );
    }
  }
}
