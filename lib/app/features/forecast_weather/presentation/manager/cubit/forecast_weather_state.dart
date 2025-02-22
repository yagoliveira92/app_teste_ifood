part of 'forecast_weather_cubit.dart';

abstract class ForecastWeatherState extends Equatable {
  const ForecastWeatherState();
}

class ForecastWeatherInitial extends ForecastWeatherState {
  @override
  List<Object> get props => [];
}

class ForecastWeatherLoading extends ForecastWeatherState {
  @override
  List<Object> get props => [];
}

class ForecastWeatherError extends ForecastWeatherState {
  @override
  List<Object> get props => [];
}

class ForecastWeatherSuccess extends ForecastWeatherState {
  const ForecastWeatherSuccess({
    required this.forecastWeatherEntity,
    this.hasConnection = true,
  });

  final ForecastWeatherEntity forecastWeatherEntity;
  final bool hasConnection;
  @override
  List<Object> get props => [
        forecastWeatherEntity,
        hasConnection,
      ];
}
