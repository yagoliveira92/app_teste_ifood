import 'package:app_teste_ifood/app/core/injector_adapter/injection_adapter.dart';
import 'package:app_teste_ifood/app/core/storage_adapter/local_database/manager/i_local_data_manager.dart';
import 'package:app_teste_ifood/app/core/remote_adapter/manager/i_remote_data_manager.dart';
import 'package:app_teste_ifood/app/features/current_weather/data/local_datasource/current_weather_local_datasource.dart';
import 'package:app_teste_ifood/app/features/current_weather/data/remote_datasource/current_weather_remote_datasource.dart';
import 'package:app_teste_ifood/app/features/current_weather/data/repositories/current_weather_repository.dart';
import 'package:app_teste_ifood/app/features/current_weather/domain/repositories/i_current_weather_repository.dart';
import 'package:app_teste_ifood/app/features/current_weather/domain/use_cases/get_current_weather_usecase.dart';
import 'package:app_teste_ifood/app/features/current_weather/presentation/manager/cubit/current_weather_cubit.dart';

class CurrentWeatherInjectionContainer {
  void call(InjectionAdapter dependency) {
    dependency.registerFactory<ICurrentWeatherRemoteDataSource>(
      CurrentWeatherRemoteDataSource(
          remoteDataManager: dependency.get<IRemoteDataManager>()),
    );

    dependency.registerFactory<ICurrentWeatherLocalDataSource>(
      CurrentWeatherLocalDataSource(
        localDataManager: dependency.get<ILocalDataManager>(),
      ),
    );

    dependency.registerFactory<ICurrentWeatherRepository>(
      CurrentWeatherRepository(
        localDataSource: dependency.get<ICurrentWeatherLocalDataSource>(),
        remoteDataSource: dependency.get<ICurrentWeatherRemoteDataSource>(),
      ),
    );

    dependency.registerFactory(
      GetCurrentWeatherUseCase(
        repository: dependency.get<ICurrentWeatherRepository>(),
      ),
    );

    dependency.registerFactory(
      () => CurrentWeatherCubit(
        getCurrentWeatherUsecase: dependency.get<GetCurrentWeatherUseCase>(),
      ),
    );
  }
}
