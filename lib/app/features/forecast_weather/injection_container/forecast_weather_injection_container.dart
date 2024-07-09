import 'package:app_teste_ifood/app/core/injector_adapter/injection_adapter.dart';
import 'package:app_teste_ifood/app/core/remote_adapter/manager/i_remote_data_manager.dart';
import 'package:app_teste_ifood/app/core/storage_adapter/local_database/manager/i_local_data_manager.dart';
import 'package:app_teste_ifood/app/features/forecast_weather/data/data_sources/local_datasource/forecast_weather_local_datasource.dart';
import 'package:app_teste_ifood/app/features/forecast_weather/data/data_sources/local_datasource/i_forecast_weather_local_datasource.dart';
import 'package:app_teste_ifood/app/features/forecast_weather/data/data_sources/remote_datasource/forecast_weather_remote_datasource.dart';
import 'package:app_teste_ifood/app/features/forecast_weather/data/data_sources/remote_datasource/i_forecast_weather_remote_datasource.dart';
import 'package:app_teste_ifood/app/features/forecast_weather/data/repositories/forecast_weather_repository.dart';
import 'package:app_teste_ifood/app/features/forecast_weather/domain/repositories/i_forecast_weather_repository.dart';
import 'package:app_teste_ifood/app/features/forecast_weather/domain/use_cases/get_forecast_weather_usecase.dart';
import 'package:app_teste_ifood/app/features/forecast_weather/presentation/manager/cubit/forecast_weather_cubit.dart';

class ForecastWeatherInjectionContainer {
  void call(InjectionAdapter dependency) {
    dependency.registerFactory<IForecastWeatherLocalDataSource>(
      ForecastWeatherLocalDataSource(
        localDataManager: dependency.get<ILocalDataManager>(),
      ),
    );

    dependency.registerFactory<IForecastWeatherRemoteDataSource>(
      ForecastWeatherRemoteDataSource(
          remoteDataManager: dependency.get<IRemoteDataManager>()),
    );

    dependency.registerFactory<IForecastWeatherRepository>(
      ForecastWeatherRepository(
        localDataSource: dependency.get<IForecastWeatherLocalDataSource>(),
        remoteDataSource: dependency.get<IForecastWeatherRemoteDataSource>(),
      ),
    );

    dependency.registerFactory(
      GetForecastWeatherUseCase(
        repository: dependency.get<IForecastWeatherRepository>(),
      ),
    );

    dependency.registerFactory(
      ForecastWeatherCubit(
        getForecastWeatherUseCase: dependency.get<GetForecastWeatherUseCase>(),
      ),
    );
  }
}
