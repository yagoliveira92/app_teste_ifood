import 'package:app_teste_ifood/app/core/injector_adapter/injection_adapter.dart';
import 'package:app_teste_ifood/app/core/remote_adapter/manager/i_remote_data_manager.dart';
import 'package:app_teste_ifood/app/core/storage_adapter/secure_storage_service.dart';
import 'package:app_teste_ifood/app/features/auth/data/data_sources/auth_local_datasource.dart';
import 'package:app_teste_ifood/app/features/auth/data/data_sources/auth_remote_datasource.dart';
import 'package:app_teste_ifood/app/features/auth/data/repositories/auth_repository.dart';
import 'package:app_teste_ifood/app/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:app_teste_ifood/app/features/auth/domain/use_cases/check_token_usecase.dart';
import 'package:app_teste_ifood/app/features/auth/domain/use_cases/login_usecase.dart';
import 'package:app_teste_ifood/app/features/auth/presentation/manager/login_cubit.dart';

class AuthInjectionContainer {
  void call(InjectionAdapter dependency) {
    dependency.registerFactory(
      AuthLocalDatasource(
          secureStorageService: dependency.get<SecureStorageService>()),
    );

    dependency.registerFactory(
      AuthRemoteDataSource(
        remoteDataManager: dependency.get<IRemoteDataManager>(),
      ),
    );

    dependency.registerFactory<IAuthRepository>(
      AuthRepository(
        authRemoteDataSource: dependency.get<AuthRemoteDataSource>(),
        authLocalDatasource: dependency.get<AuthLocalDatasource>(),
      ),
    );

    dependency.registerFactory(
      LoginUsecase(
        authRepository: dependency.get<IAuthRepository>(),
      ),
    );

    dependency.registerFactory<CheckTokenUsecase>(
      CheckTokenUsecase(
        authRepository: dependency.get<IAuthRepository>(),
      ),
    );

    dependency.registerFactory<LoginCubit>(
      LoginCubit(
        loginUsecase: dependency.get<LoginUsecase>(),
        checkTokenUsecase: dependency.get<CheckTokenUsecase>(),
      ),
    );
  }
}
