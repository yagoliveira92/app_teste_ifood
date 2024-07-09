import 'package:app_teste_ifood/app/features/current_weather/domain/use_cases/get_current_weather_usecase.dart';
import 'package:app_teste_ifood/app/features/current_weather/presentation/manager/cubit/current_weather_cubit.dart';
import 'package:app_teste_ifood/app/features/current_weather/presentation/pages/current_weather_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:app_teste_ifood/app/core/containers/injection_container.dart';

final getRouterContainer = [
  GoRoute(
    path: '/current-weather',
    builder: (context, state) => BlocProvider<CurrentWeatherCubit>(
      create: (context) => CurrentWeatherCubit(
          getCurrentWeatherUsecase: dependency.get<GetCurrentWeatherUseCase>())
        ..getCurrentWeather(),
      child: const CurrentWeatherScreen(),
    ),
  ),
];
