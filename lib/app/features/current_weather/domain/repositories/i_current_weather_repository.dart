import 'package:app_teste_ifood/app/core/network/response_types/error/i_response.dart';
import 'package:app_teste_ifood/app/features/current_weather/domain/entities/current_weather_entity.dart';

abstract class ICurrentWeatherRepository {
  Future<({Response result, CurrentWeatherEntity currentWeather})>
      getCurrentWeather({required String city});
}
