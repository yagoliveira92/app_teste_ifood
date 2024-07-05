import 'package:app_teste_ifood/app/core/remote_adapter/models/remote_data.dart';

abstract class ICurrentWeatherRemoteDataSource {
  Future<RemoteData> getCurrentWeather({required String city});
}
