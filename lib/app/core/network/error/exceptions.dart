import 'package:app_teste_ifood/app/core/network/error/response.dart';

class NoConnectionException extends Response implements Exception {
  get message => 'Sem conexão com a internet.';
}

class UnauthorizedException extends Response implements Exception {
  get message => 'Você não tem permissão para acessar este recurso.';
}
