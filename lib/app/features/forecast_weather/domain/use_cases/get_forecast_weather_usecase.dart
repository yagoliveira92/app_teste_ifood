import 'package:app_teste_ifood/app/core/network/response_types/error/i_response.dart';
import 'package:app_teste_ifood/app/features/forecast_weather/domain/entities/forecast_weather_entity.dart';
import 'package:app_teste_ifood/app/features/forecast_weather/domain/repositories/i_forecast_weather_repository.dart';

class GetForecastWeatherUseCase {
  final IForecastWeatherRepository repository;

  GetForecastWeatherUseCase({required this.repository});

  Future<({Response result, ForecastWeatherEntity forecastWeather})> call(
      String city) async {
    return await repository.getForecastWeather(city: city);
  }
}
