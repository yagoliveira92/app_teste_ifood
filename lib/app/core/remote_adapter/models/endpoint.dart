import 'methods_enum.dart';

class Endpoint {
  Endpoint({
    required this.method,
    required this.path,
    this.isFormUrlEncoded = false,
    this.query,
    this.data,
  });

  final Methods method;
  final String path;
  final bool isFormUrlEncoded;
  final Map<String, String>? query;
  final Map<String, dynamic>? data;
}
