import 'package:app_teste_ifood/app/core/remote_adapter/manager/i_remote_data_manager.dart';
import 'package:app_teste_ifood/app/core/remote_adapter/models/endpoint.dart';
import 'package:app_teste_ifood/app/core/remote_adapter/models/methods_enum.dart';
import 'package:app_teste_ifood/app/core/remote_adapter/models/remote_data.dart';

abstract class ICurrentWeatherRemoteDataSource {
  Future<RemoteData> getCurrentWeather({required String city});
}

class CurrentWeatherRemoteDataSource
    implements ICurrentWeatherRemoteDataSource {
  const CurrentWeatherRemoteDataSource({
    required this.remoteDataManager,
  });

  final IRemoteDataManager remoteDataManager;

  @override
  Future<RemoteData> getCurrentWeather({required String city}) async {
    final endpoint = Endpoint(
      method: Methods.get,
      query: {
        'units': 'metric',
        'q': city,
      },
      path: '/weather',
    );
    return remoteDataManager.request(endpoint: endpoint);
  }
}
