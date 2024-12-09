import 'package:app_teste_ifood/app/features/current_weather/schema_container/current_weather_schema_container.dart'
as current_weather;
import 'package:isar/isar.dart';

final getSchemas = <CollectionSchema<dynamic>>[
  ...current_weather.getSchemas,
];
