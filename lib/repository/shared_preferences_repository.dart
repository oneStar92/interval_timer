import 'package:shared_preferences/shared_preferences.dart';
import 'package:tabata_timer/presentation/model/tabata_element.dart';

abstract interface class SharedPreferencesRepository {
  Future<Map<String, int?>> loadAll();

  Future<bool> save(String key, int value);
}

final class DefaultSharedPreferencesRepository implements SharedPreferencesRepository {
  @override
  Future<Map<String, int?>> loadAll() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final Map<String, int?> result = {};
    for (var element in TabataElement.values) {
      result[element.key] = prefs.getInt(element.key);
    }
    return result;
  }

  @override
  Future<bool> save(String key, int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt(key, value);
  }
}
