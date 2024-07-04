class Response {}

class ConnectionFailure extends Response {}

class GeneralFailure extends Response {
  final String message;

  GeneralFailure({message})
      : message = message ?? 'Ocorreu um erro. Tente novamente mais tarde';
}

class Success extends Response {}
