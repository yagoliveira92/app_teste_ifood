import 'dart:developer';
import 'dart:io';
import 'package:http_interceptor/http_interceptor.dart';

class RemoteDataInterceptor extends InterceptorContract {
  RemoteDataInterceptor({
    required this.apiKey,
  });

  final String apiKey;

  @override
  Future<BaseRequest> interceptRequest({
    required BaseRequest request,
  }) async {
    final Map<String, String> headers = Map.from(request.headers);
    headers[HttpHeaders.contentTypeHeader] = 'application/json';
    final queryParameters = request.url.queryParameters;
    final newRequest = request.copyWith(
      url: request.url.replace(
        queryParameters: {
          ...queryParameters,
          'appid': apiKey,
        },
      ),
      headers: headers,
    );
    print('----- Request -----');
    print(newRequest.toString());
    print(newRequest.headers.toString());
    return newRequest;
  }

  @override
  Future<BaseResponse> interceptResponse({
    required BaseResponse response,
  }) async {
    log('----- Response -----');
    log('Code: ${response.statusCode}');
    if (response is Response) {
      log((response).body);
    }
    return response;
  }
}
