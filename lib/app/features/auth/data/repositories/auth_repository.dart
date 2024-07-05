import 'package:app_teste_ifood/app/core/network/response_types/error/exceptions.dart';
import 'package:app_teste_ifood/app/core/network/response_types/error/i_response.dart';
import 'package:app_teste_ifood/app/core/network/response_types/error/response.dart';
import 'package:app_teste_ifood/app/core/network/response_types/success/success.dart';
import 'package:app_teste_ifood/app/features/auth/data/data_sources/auth_local_datasource.dart';
import 'package:app_teste_ifood/app/features/auth/data/data_sources/auth_remote_datasource.dart';
import 'package:app_teste_ifood/app/features/auth/domain/repositories/i_auth_repository.dart';

class AuthRepository implements IAuthRepository {
  const AuthRepository({
    required this.authRemoteDataSource,
    required this.authLocalDatasource,
  });

  final IAuthRemoteDataSource authRemoteDataSource;
  final IAuthLocalDatasource authLocalDatasource;
  @override
  Future<Response> login({
    required String email,
    required String password,
  }) async {
    final response = await authRemoteDataSource.login(
      email: email,
      password: password,
    );
    if (response.isSuccess) {
      await authLocalDatasource.savaToken(response.data!['token']);
      return Success();
    }
    if (response.noConnection) {
      return NoConnectionException();
    }
    if (response.statusCode == 401) {
      return UnauthorizedException();
    }
    return GeneralFailure(message: response.data);
  }

  @override
  Future<void> forgotPassword({required String email}) async {
    await authRemoteDataSource.forgotPassword(email: email);
  }
}
