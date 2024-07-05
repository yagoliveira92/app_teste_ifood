import 'package:app_teste_ifood/app/common/error/failure.dart';
import 'package:app_teste_ifood/app/features/forecast_weather/domain/entities/forecast_weather_entity.dart';

abstract class IForecastWeatherRepository {
  Future<({Failure error, ForecastWeatherEntity forecastWeather})>
      getForecastWeather({required String city});
}
