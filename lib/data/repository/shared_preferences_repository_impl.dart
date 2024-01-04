import 'package:shared_preferences/shared_preferences.dart';
import 'package:tabata_timer/domain/model/tabata_element.dart';
import 'package:tabata_timer/domain/repository/shared_preferences_repository.dart';

final class SharedPreferencesRepositoryImpl implements SharedPreferencesRepository {
  static const _key = 'tabata';

  @override
  Future<String?> loadAll() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key);
  }

  @override
  Future<bool> save(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_key, value);
  }
}
