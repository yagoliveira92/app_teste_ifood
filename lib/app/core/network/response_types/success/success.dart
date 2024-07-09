import 'package:app_teste_ifood/app/core/network/response_types/error/i_response.dart';

class Success extends Response {
  Success({this.hasConnection = true}) : super();

  @override
  final bool hasConnection;
}
