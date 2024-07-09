import 'package:app_teste_ifood/app/core/constants/app_constants_manager.dart';
import 'package:app_teste_ifood/app/core/constants/environments_enum.dart';
import 'package:app_teste_ifood/app/core/injector_adapter/injection_adapter.dart';
import 'package:app_teste_ifood/app/core/network/local_adapter/manager/i_local_data_manager.dart';
import 'package:app_teste_ifood/app/core/network/local_adapter/manager/local_data_manager.dart';
import 'package:app_teste_ifood/app/core/remote_adapter/manager/i_remote_data_manager.dart';
import 'package:app_teste_ifood/app/core/remote_adapter/manager/remote_data_manager.dart';
import 'package:app_teste_ifood/app/core/remote_adapter/provider/i_remote_data_provider.dart';
import 'package:app_teste_ifood/app/core/remote_adapter/provider/remote_data_provider.dart';
import 'package:app_teste_ifood/app/core/storage_adapter/secure_storage_adapter.dart';
import 'package:app_teste_ifood/app/core/storage_adapter/secure_storage_service.dart';
import 'package:app_teste_ifood/app/features/auth/injection/auth_injection_container.dart';
import 'package:app_teste_ifood/app/features/current_weather/injection_container/current_weather_injection_container.dart';
import 'package:app_teste_ifood/app/features/forecast_weather/injection_container/forecast_weather_injection_container.dart';

const environment = String.fromEnvironment('ENVIRONMENT', defaultValue: 'DEV');
final dependency = InjectionAdapter();

Future<void> init() async {
  dependency.registerLazySingleton<SecureStorageService>(
    SecureStorageAdapter(),
  );

  dependency.registerLazySingleton<ILocalDataManager>(
    LocalDataManager(),
  );

  dependency.registerLazySingleton<IAppConstantsManager>(
    AppConstantsManager(
      apiBaseUrl: EnvironmentsEnumMethods.envFromString(environment).apiBaseUrl,
      apiKey: EnvironmentsEnumMethods.envFromString(environment).apiKey,
    ),
  );

  dependency.registerLazySingleton<IRemoteDataProvider>(
    RemoteDataProvider(
      appConstants: dependency.get<IAppConstantsManager>(),
    ),
  );

  dependency.registerLazySingleton<IRemoteDataManager>(
    RemoteDataManager(
      dataProvider: dependency.get<IRemoteDataProvider>(),
    ),
  );

  final authInjectionContainer = AuthInjectionContainer();
  authInjectionContainer(dependency);

  final customWeatherInjectionContainer = CurrentWeatherInjectionContainer();
  customWeatherInjectionContainer(dependency);

  final forecastWeatherInjectionContainer = ForecastWeatherInjectionContainer();
  forecastWeatherInjectionContainer(dependency);
}
