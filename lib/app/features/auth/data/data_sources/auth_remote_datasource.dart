import 'package:app_teste_ifood/app/core/remote_adapter/manager/i_remote_data_manager.dart';
import 'package:app_teste_ifood/app/core/remote_adapter/models/endpoint.dart';
import 'package:app_teste_ifood/app/core/remote_adapter/models/methods_enum.dart';
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

  @override
  Future<RemoteData> login({
    required String email,
    required String password,
  }) async {
    final endpoint = Endpoint(method: Methods.post, path: '/login');
    return remoteDataManager.request(endpoint: endpoint);
  }

  @override
  Future<RemoteData> forgotPassword({required String email}) {
    throw UnimplementedError();
  }
}
