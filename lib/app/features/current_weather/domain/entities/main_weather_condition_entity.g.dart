// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_weather_condition_entity.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const MainWeatherCondiditonEntitySchema = Schema(
  name: r'MainWeatherCondiditonEntity',
  id: -412224978131936566,
  properties: {
    r'feelsLike': PropertySchema(
      id: 0,
      name: r'feelsLike',
      type: IsarType.double,
    ),
    r'grndLevel': PropertySchema(
      id: 1,
      name: r'grndLevel',
      type: IsarType.long,
    ),
    r'hashCode': PropertySchema(
      id: 2,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'humidity': PropertySchema(
      id: 3,
      name: r'humidity',
      type: IsarType.long,
    ),
    r'pressure': PropertySchema(
      id: 4,
      name: r'pressure',
      type: IsarType.long,
    ),
    r'seaLevel': PropertySchema(
      id: 5,
      name: r'seaLevel',
      type: IsarType.long,
    ),
    r'stringify': PropertySchema(
      id: 6,
      name: r'stringify',
      type: IsarType.bool,
    ),
    r'temp': PropertySchema(
      id: 7,
      name: r'temp',
      type: IsarType.double,
    ),
    r'tempMax': PropertySchema(
      id: 8,
      name: r'tempMax',
      type: IsarType.double,
    ),
    r'tempMin': PropertySchema(
      id: 9,
      name: r'tempMin',
      type: IsarType.double,
    )
  },
  estimateSize: _mainWeatherCondiditonEntityEstimateSize,
  serialize: _mainWeatherCondiditonEntitySerialize,
  deserialize: _mainWeatherCondiditonEntityDeserialize,
  deserializeProp: _mainWeatherCondiditonEntityDeserializeProp,
);

int _mainWeatherCondiditonEntityEstimateSize(
  MainWeatherCondiditonEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _mainWeatherCondiditonEntitySerialize(
  MainWeatherCondiditonEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.feelsLike);
  writer.writeLong(offsets[1], object.grndLevel);
  writer.writeLong(offsets[2], object.hashCode);
  writer.writeLong(offsets[3], object.humidity);
  writer.writeLong(offsets[4], object.pressure);
  writer.writeLong(offsets[5], object.seaLevel);
  writer.writeBool(offsets[6], object.stringify);
  writer.writeDouble(offsets[7], object.temp);
  writer.writeDouble(offsets[8], object.tempMax);
  writer.writeDouble(offsets[9], object.tempMin);
}

MainWeatherCondiditonEntity _mainWeatherCondiditonEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MainWeatherCondiditonEntity(
    feelsLike: reader.readDoubleOrNull(offsets[0]),
    grndLevel: reader.readLongOrNull(offsets[1]),
    humidity: reader.readLongOrNull(offsets[3]),
    pressure: reader.readLongOrNull(offsets[4]),
    seaLevel: reader.readLongOrNull(offsets[5]),
    temp: reader.readDoubleOrNull(offsets[7]),
    tempMax: reader.readDoubleOrNull(offsets[8]),
    tempMin: reader.readDoubleOrNull(offsets[9]),
  );
  return object;
}

P _mainWeatherCondiditonEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readBoolOrNull(offset)) as P;
    case 7:
      return (reader.readDoubleOrNull(offset)) as P;
    case 8:
      return (reader.readDoubleOrNull(offset)) as P;
    case 9:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension MainWeatherCondiditonEntityQueryFilter on QueryBuilder<
    MainWeatherCondiditonEntity,
    MainWeatherCondiditonEntity,
    QFilterCondition> {
  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> feelsLikeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'feelsLike',
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> feelsLikeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'feelsLike',
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> feelsLikeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'feelsLike',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> feelsLikeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'feelsLike',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> feelsLikeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'feelsLike',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> feelsLikeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'feelsLike',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> grndLevelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'grndLevel',
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> grndLevelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'grndLevel',
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> grndLevelEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grndLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> grndLevelGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'grndLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> grndLevelLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'grndLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> grndLevelBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'grndLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> hashCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> hashCodeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> hashCodeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> hashCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hashCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> humidityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'humidity',
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> humidityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'humidity',
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> humidityEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'humidity',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> humidityGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'humidity',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> humidityLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'humidity',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> humidityBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'humidity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> pressureIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pressure',
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> pressureIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pressure',
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> pressureEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pressure',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> pressureGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pressure',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> pressureLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pressure',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> pressureBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pressure',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> seaLevelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'seaLevel',
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> seaLevelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'seaLevel',
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> seaLevelEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'seaLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> seaLevelGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'seaLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> seaLevelLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'seaLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> seaLevelBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'seaLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> stringifyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stringify',
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> stringifyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stringify',
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> stringifyEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stringify',
        value: value,
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> tempIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'temp',
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> tempIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'temp',
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> tempEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'temp',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> tempGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'temp',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> tempLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'temp',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> tempBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'temp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> tempMaxIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tempMax',
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> tempMaxIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tempMax',
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> tempMaxEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tempMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> tempMaxGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tempMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> tempMaxLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tempMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> tempMaxBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tempMax',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> tempMinIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tempMin',
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> tempMinIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tempMin',
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> tempMinEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tempMin',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> tempMinGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tempMin',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> tempMinLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tempMin',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MainWeatherCondiditonEntity, MainWeatherCondiditonEntity,
      QAfterFilterCondition> tempMinBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tempMin',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension MainWeatherCondiditonEntityQueryObject on QueryBuilder<
    MainWeatherCondiditonEntity,
    MainWeatherCondiditonEntity,
    QFilterCondition> {}
