// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCurrentWeatherEntityCollection on Isar {
  IsarCollection<CurrentWeatherEntity> get currentWeatherEntitys =>
      this.collection();
}

const CurrentWeatherEntitySchema = CollectionSchema(
  name: r'CurrentWeatherEntity',
  id: -7112462524892727692,
  properties: {
    r'coord': PropertySchema(
      id: 0,
      name: r'coord',
      type: IsarType.object,
      target: r'CoordinatorEntity',
    ),
    r'hashCode': PropertySchema(
      id: 1,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'main': PropertySchema(
      id: 2,
      name: r'main',
      type: IsarType.object,
      target: r'MainWeatherCondiditonEntity',
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    ),
    r'stringify': PropertySchema(
      id: 4,
      name: r'stringify',
      type: IsarType.bool,
    ),
    r'weatherEntities': PropertySchema(
      id: 5,
      name: r'weatherEntities',
      type: IsarType.objectList,
      target: r'WeatherEntity',
    )
  },
  estimateSize: _currentWeatherEntityEstimateSize,
  serialize: _currentWeatherEntitySerialize,
  deserialize: _currentWeatherEntityDeserialize,
  deserializeProp: _currentWeatherEntityDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'CoordinatorEntity': CoordinatorEntitySchema,
    r'WeatherEntity': WeatherEntitySchema,
    r'MainWeatherCondiditonEntity': MainWeatherCondiditonEntitySchema
  },
  getId: _currentWeatherEntityGetId,
  getLinks: _currentWeatherEntityGetLinks,
  attach: _currentWeatherEntityAttach,
  version: '3.1.0+1',
);

int _currentWeatherEntityEstimateSize(
  CurrentWeatherEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.coord;
    if (value != null) {
      bytesCount += 3 +
          CoordinatorEntitySchema.estimateSize(
              value, allOffsets[CoordinatorEntity]!, allOffsets);
    }
  }
  {
    final value = object.main;
    if (value != null) {
      bytesCount += 3 +
          MainWeatherCondiditonEntitySchema.estimateSize(
              value, allOffsets[MainWeatherCondiditonEntity]!, allOffsets);
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.weatherEntities;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[WeatherEntity]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              WeatherEntitySchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _currentWeatherEntitySerialize(
  CurrentWeatherEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<CoordinatorEntity>(
    offsets[0],
    allOffsets,
    CoordinatorEntitySchema.serialize,
    object.coord,
  );
  writer.writeLong(offsets[1], object.hashCode);
  writer.writeObject<MainWeatherCondiditonEntity>(
    offsets[2],
    allOffsets,
    MainWeatherCondiditonEntitySchema.serialize,
    object.main,
  );
  writer.writeString(offsets[3], object.name);
  writer.writeBool(offsets[4], object.stringify);
  writer.writeObjectList<WeatherEntity>(
    offsets[5],
    allOffsets,
    WeatherEntitySchema.serialize,
    object.weatherEntities,
  );
}

CurrentWeatherEntity _currentWeatherEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CurrentWeatherEntity(
    coord: reader.readObjectOrNull<CoordinatorEntity>(
      offsets[0],
      CoordinatorEntitySchema.deserialize,
      allOffsets,
    ),
    main: reader.readObjectOrNull<MainWeatherCondiditonEntity>(
      offsets[2],
      MainWeatherCondiditonEntitySchema.deserialize,
      allOffsets,
    ),
    name: reader.readStringOrNull(offsets[3]),
    weatherEntities: reader.readObjectList<WeatherEntity>(
      offsets[5],
      WeatherEntitySchema.deserialize,
      allOffsets,
      WeatherEntity(),
    ),
  );
  return object;
}

P _currentWeatherEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<CoordinatorEntity>(
        offset,
        CoordinatorEntitySchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readObjectOrNull<MainWeatherCondiditonEntity>(
        offset,
        MainWeatherCondiditonEntitySchema.deserialize,
        allOffsets,
      )) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readBoolOrNull(offset)) as P;
    case 5:
      return (reader.readObjectList<WeatherEntity>(
        offset,
        WeatherEntitySchema.deserialize,
        allOffsets,
        WeatherEntity(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _currentWeatherEntityGetId(CurrentWeatherEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _currentWeatherEntityGetLinks(
    CurrentWeatherEntity object) {
  return [];
}

void _currentWeatherEntityAttach(
    IsarCollection<dynamic> col, Id id, CurrentWeatherEntity object) {}

extension CurrentWeatherEntityQueryWhereSort
    on QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity, QWhere> {
  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CurrentWeatherEntityQueryWhere
    on QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity, QWhereClause> {
  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CurrentWeatherEntityQueryFilter on QueryBuilder<CurrentWeatherEntity,
    CurrentWeatherEntity, QFilterCondition> {
  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity,
      QAfterFilterCondition> coordIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'coord',
      ));
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity,
      QAfterFilterCondition> coordIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'coord',
      ));
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity,
      QAfterFilterCondition> hashCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity,
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

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity,
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

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity,
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

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity,
      QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity,
      QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity,
      QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity,
      QAfterFilterCondition> mainIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'main',
      ));
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity,
      QAfterFilterCondition> mainIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'main',
      ));
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity,
      QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity,
      QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity,
      QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity,
      QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity,
      QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity,
      QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity,
      QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity,
      QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity,
          QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity,
          QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity,
      QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity,
      QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity,
      QAfterFilterCondition> stringifyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stringify',
      ));
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity,
      QAfterFilterCondition> stringifyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stringify',
      ));
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity,
      QAfterFilterCondition> stringifyEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stringify',
        value: value,
      ));
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity,
      QAfterFilterCondition> weatherEntitiesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'weatherEntities',
      ));
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity,
      QAfterFilterCondition> weatherEntitiesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'weatherEntities',
      ));
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity,
      QAfterFilterCondition> weatherEntitiesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weatherEntities',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity,
      QAfterFilterCondition> weatherEntitiesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weatherEntities',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity,
      QAfterFilterCondition> weatherEntitiesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weatherEntities',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity,
      QAfterFilterCondition> weatherEntitiesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weatherEntities',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity,
      QAfterFilterCondition> weatherEntitiesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weatherEntities',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity,
      QAfterFilterCondition> weatherEntitiesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weatherEntities',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension CurrentWeatherEntityQueryObject on QueryBuilder<CurrentWeatherEntity,
    CurrentWeatherEntity, QFilterCondition> {
  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity,
      QAfterFilterCondition> coord(FilterQuery<CoordinatorEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'coord');
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity,
      QAfterFilterCondition> main(FilterQuery<MainWeatherCondiditonEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'main');
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity,
          QAfterFilterCondition>
      weatherEntitiesElement(FilterQuery<WeatherEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'weatherEntities');
    });
  }
}

extension CurrentWeatherEntityQueryLinks on QueryBuilder<CurrentWeatherEntity,
    CurrentWeatherEntity, QFilterCondition> {}

extension CurrentWeatherEntityQuerySortBy
    on QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity, QSortBy> {
  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity, QAfterSortBy>
      sortByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity, QAfterSortBy>
      sortByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity, QAfterSortBy>
      sortByStringify() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stringify', Sort.asc);
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity, QAfterSortBy>
      sortByStringifyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stringify', Sort.desc);
    });
  }
}

extension CurrentWeatherEntityQuerySortThenBy
    on QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity, QSortThenBy> {
  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity, QAfterSortBy>
      thenByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity, QAfterSortBy>
      thenByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity, QAfterSortBy>
      thenByStringify() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stringify', Sort.asc);
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity, QAfterSortBy>
      thenByStringifyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stringify', Sort.desc);
    });
  }
}

extension CurrentWeatherEntityQueryWhereDistinct
    on QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity, QDistinct> {
  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity, QDistinct>
      distinctByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashCode');
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CurrentWeatherEntity, CurrentWeatherEntity, QDistinct>
      distinctByStringify() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stringify');
    });
  }
}

extension CurrentWeatherEntityQueryProperty on QueryBuilder<
    CurrentWeatherEntity, CurrentWeatherEntity, QQueryProperty> {
  QueryBuilder<CurrentWeatherEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CurrentWeatherEntity, CoordinatorEntity?, QQueryOperations>
      coordProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coord');
    });
  }

  QueryBuilder<CurrentWeatherEntity, int, QQueryOperations> hashCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashCode');
    });
  }

  QueryBuilder<CurrentWeatherEntity, MainWeatherCondiditonEntity?,
      QQueryOperations> mainProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'main');
    });
  }

  QueryBuilder<CurrentWeatherEntity, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<CurrentWeatherEntity, bool?, QQueryOperations>
      stringifyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stringify');
    });
  }

  QueryBuilder<CurrentWeatherEntity, List<WeatherEntity>?, QQueryOperations>
      weatherEntitiesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weatherEntities');
    });
  }
}
