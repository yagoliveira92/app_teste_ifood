import 'dart:async';

import 'package:app_teste_ifood/app/core/storage_adapter/local_database/manager/i_local_data_manager.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:app_teste_ifood/app/core/containers/schemas_container.dart'
as schemas;

class LocalDataManager<T extends IsarCollection> implements ILocalDataManager<T>{
  late final Isar _isar;


  @override
  Future<void> start() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      schemas.getSchemas,
      directory: dir.path,
      inspector: true,
    );
  }

  @override
  Future<void> save(T object) async {
    await _isar.writeTxn(() async {
      await object.put(object);
    });
  }

  @override
  Future<T?> get(int id) async {
    return await _isar.<T>(id);
  }

  @override
  Future<List<T>> getAll() async {
    return await _isar.where().findAll();
  }

  @override
  Future<void> delete(int id) async {
    await _isar.writeTxn(() async {
      await _collection.delete(id);
    });
  }
}
