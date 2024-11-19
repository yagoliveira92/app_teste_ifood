import 'package:app_teste_ifood/app/core/constants/app_constants_manager.dart';
import 'package:http/http.dart' as http;
import 'package:app_teste_ifood/app/core/remote_adapter/interceptor/remote_data_interceptor.dart';
import 'package:http_interceptor/http_interceptor.dart';

import 'i_remote_data_provider.dart';

class RemoteDataProvider implements IRemoteDataProvider {
  RemoteDataProvider({required IAppConstantsManager appConstants}) {
    _client = InterceptedClient.build(interceptors: [
      RemoteDataInterceptor(apiKey: appConstants.apiKey),
    ]);
    _baseUrl = appConstants.apiBaseUrl;
  }

  late final Client _client;
  late final String _baseUrl;

  @override
  void configureRequest({
    required bool isFormUrlEncoded,
  }) {}

  @override
  Future<Response?> get({
    required String path,
    Map<String, dynamic>? query,
  }) async {
    try {
      return await _client.get(Uri.https(
        _baseUrl,
        '/data/2.5$path',
        query,
      ));
    } catch (error) {
      // await FirebaseCrashlytics.instance.recordError(
      //   error,
      //   error.stackTrace,
      //   reason: error.response?.statusMessage ?? '',
      //   information: [error.toString()],
      // );
      // FirebaseCrashlytics.instance.setCustomKey('api_error',
      //     'Code: ${error.response?.statusCode}, body: ${error.response?.statusMessage}');
      return http.Response(
        error.toString(),
        700,
      );
      ;
    }
  }

  @override
  Future<Response?> post({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      return await _client.post(
        Uri(
          path: _baseUrl + path,
          queryParameters: query,
        ),
        body: data,
      );
    } on Exception catch (error) {
      // await FirebaseCrashlytics.instance.recordError(
      //   error,
      //   error.stackTrace,
      //   reason: error.response?.statusMessage ?? '',
      //   information: [error.toString()],
      // );
      // FirebaseCrashlytics.instance.setCustomKey('api_error',
      //     'Code: ${error.response?.statusCode}, body: ${error.response?.statusMessage}');
      return http.Response(
        error.toString(),
        700,
      );
    }
  }

  @override
  Future<Response?> put({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      return await _client.put(
        Uri(
          path: _baseUrl + path,
          queryParameters: query,
        ),
        body: data,
      );
    } on Exception catch (error) {
      // await FirebaseCrashlytics.instance.recordError(
      //   error,
      //   error.stackTrace,
      //   reason: error.response?.statusMessage ?? '',
      //   information: [error.toString()],
      // );
      // FirebaseCrashlytics.instance.setCustomKey('api_error',
      //     'Code: ${error.response?.statusCode}, body: ${error.response?.statusMessage}');
      return http.Response(
        error.toString(),
        700,
      );
    }
  }

  @override
  Future<Response?> patch({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      return await _client.patch(
        Uri(
          path: _baseUrl + path,
          queryParameters: query,
        ),
        body: data,
      );
    } on Exception catch (error) {
      // await FirebaseCrashlytics.instance.recordError(
      //   error,
      //   error.stackTrace,
      //   reason: error.response?.statusMessage ?? '',
      //   information: [error.toString()],
      // );
      // FirebaseCrashlytics.instance.setCustomKey('api_error',
      //     'Code: ${error.response?.statusCode}, body: ${error.response?.statusMessage}');
      return http.Response(
        error.toString(),
        700,
      );
    }
  }

  @override
  Future<Response?> delete({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      return await _client.delete(
        Uri(
          path: _baseUrl + path,
          queryParameters: query,
        ),
        body: data,
      );
    } on Exception catch (error) {
      // await FirebaseCrashlytics.instance.recordError(
      //   error,
      //   error.stackTrace,
      //   reason: error.response?.statusMessage ?? '',
      //   information: [error.toString()],
      // );
      // FirebaseCrashlytics.instance.setCustomKey('api_error',
      //     'Code: ${error.response?.statusCode}, body: ${error.response?.statusMessage}, route: ${error.response?.realUri}');
      return http.Response(
        error.toString(),
        700,
      );
    }
  }
}
