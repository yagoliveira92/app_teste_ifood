abstract class ILocalDataManager<T> {
  Future<void> start();
  Future<void> save(T object);
  Future<T?> get(int id);
  Future<List<T>> getAll();
  Future<void> delete(int id);
}
