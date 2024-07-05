import 'package:app_teste_ifood/app/core/remote_adapter/models/remote_data.dart';

abstract class IForecastWeatherRemoteDataSource {
  Future<RemoteData> getForecastWeather({required String city});
}
