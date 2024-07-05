import 'package:app_teste_ifood/app/core/network/response_types/error/i_response.dart';
import 'package:app_teste_ifood/app/features/forecast_weather/domain/entities/forecast_weather_entity.dart';

abstract class IForecastWeatherRepository {
  Future<({Response result, ForecastWeatherEntity forecastWeather})>
      getForecastWeather({required String city});
}
