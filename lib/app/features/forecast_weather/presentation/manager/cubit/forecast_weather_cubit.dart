import 'package:app_teste_ifood/app/core/network/response_types/success/success.dart';
import 'package:app_teste_ifood/app/features/forecast_weather/domain/entities/forecast_weather_entity.dart';
import 'package:app_teste_ifood/app/features/forecast_weather/domain/use_cases/get_forecast_weather_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'forecast_weather_state.dart';

class ForecastWeatherCubit extends Cubit<ForecastWeatherState> {
  ForecastWeatherCubit({required this.getForecastWeatherUseCase})
      : super(ForecastWeatherInitial());

  final GetForecastWeatherUseCase getForecastWeatherUseCase;

  Future<void> getForecast({required String city}) async {
    emit(ForecastWeatherLoading());
    final forecastWeather = await getForecastWeatherUseCase(city);
    if (forecastWeather.result is Success) {
      emit(
        ForecastWeatherSuccess(
          forecastWeatherEntity: forecastWeather.forecastWeather,
          hasConnection: forecastWeather.result.hasConnection,
        ),
      );
    } else {
      emit(ForecastWeatherError());
    }
  }
}
