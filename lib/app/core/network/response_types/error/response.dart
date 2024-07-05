import 'package:app_teste_ifood/app/core/network/response_types/error/i_response.dart';

class ConnectionFailure extends Response {}

class GeneralFailure extends Response {
  final String message;

  GeneralFailure({message})
      : message = message ?? 'Ocorreu um erro. Tente novamente mais tarde';
}
