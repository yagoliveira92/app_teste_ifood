import 'package:app_teste_ifood/app/features/forecast_weather/domain/use_cases/get_forecast_weather_usecase.dart';
import 'package:app_teste_ifood/app/features/forecast_weather/presentation/manager/cubit/forecast_weather_cubit.dart';
import 'package:app_teste_ifood/app/features/forecast_weather/presentation/pages/forecast_weather_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:app_teste_ifood/app/core/containers/injection_container.dart';

final getRouterContainer = [
  GoRoute(
    path: '/forecast-weather/:city',
    builder: (context, state) => BlocProvider<ForecastWeatherCubit>(
      create: (context) => ForecastWeatherCubit(
          getForecastWeatherUseCase:
              dependency.get<GetForecastWeatherUseCase>())
        ..getForecast(city: state.pathParameters['city'] ?? ''),
      child: const ForecastWeatherScreen(),
    ),
  ),
];
