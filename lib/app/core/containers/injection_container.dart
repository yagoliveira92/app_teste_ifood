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

const environment = Environments.production;
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
      apiBaseUrl: environment.apiBaseUrl,
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
}
