abstract class Repository {
  Future<int> getInt(String key);
  Future<bool> saveInt(String key, int value);
}
