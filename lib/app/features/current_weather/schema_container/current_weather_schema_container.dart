import 'package:app_teste_ifood/app/features/current_weather/domain/entities/coordinator_entity.dart';
import 'package:app_teste_ifood/app/features/current_weather/domain/entities/current_weather_entity.dart';
import 'package:app_teste_ifood/app/features/current_weather/domain/entities/main_weather_condition_entity.dart';
import 'package:app_teste_ifood/app/features/current_weather/domain/entities/weather_entity.dart';
import 'package:isar/isar.dart';

final getSchemas = <CollectionSchema<dynamic>>[
  CurrentWeatherEntitySchema,
];