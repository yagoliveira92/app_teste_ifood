import 'package:app_teste_ifood/app/core/remote_adapter/manager/i_remote_data_manager.dart';
import 'package:app_teste_ifood/app/core/remote_adapter/models/remote_data.dart';

abstract class IAuthRemoteDataSource {
  Future<RemoteData> login({required String email, required String password});
  Future<RemoteData> forgotPassword({required String email});
}

class AuthRemoteDataSource implements IAuthRemoteDataSource {
  const AuthRemoteDataSource({
    required this.remoteDataManager,
  });

  final IRemoteDataManager remoteDataManager;

  // Para efeitos do Teste eu não fiz a comunicação com o backend, mantendo o
  // Login e Senha fixos, retornando um token fixo.
  @override
  Future<RemoteData> login({
    required String email,
    required String password,
  }) async {
    // final endpoint = Endpoint(method: Methods.post, path: '/login');
    // return remoteDataManager.request(endpoint: endpoint);
    return RemoteData(
      data: {'token': 'token_success'},
      noConnection: false,
      statusCode: 200,
    );
  }

  @override
  Future<RemoteData> forgotPassword({required String email}) {
    throw UnimplementedError();
  }
}
