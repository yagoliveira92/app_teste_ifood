import 'package:app_teste_ifood/app/core/network/response_types/success/success.dart';
import 'package:app_teste_ifood/app/features/current_weather/domain/entities/current_weather_entity.dart';
import 'package:app_teste_ifood/app/features/current_weather/domain/use_cases/get_current_weather_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'current_weather_state.dart';

class CurrentWeatherCubit extends Cubit<CurrentWeatherState> {
  CurrentWeatherCubit({
    required this.getCurrentWeatherUsecase,
  }) : super(CurrentWeatherInitial());

  final GetCurrentWeatherUseCase getCurrentWeatherUsecase;

  Future<void> getCurrentWeather() async {
    emit(CurrentWeatherLoading());
    final currentWeatherResult = await getCurrentWeatherUsecase();
    if (currentWeatherResult.result is Success) {
      emit(
        CurrentWeatherSuccess(
            currentWeatherList: currentWeatherResult.currentWeatherList),
      );
    } else {
      emit(CurrentWeatherError());
    }
  }
}
