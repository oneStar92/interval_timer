abstract interface class SharedPreferencesRepository {
  Future<String?> loadAll();

  Future<bool> save(String value);
}
