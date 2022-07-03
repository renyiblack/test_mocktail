import 'package:mocktail_test/features/repositories/repository.dart';
import 'package:shared_preferences/shared_preferences.dart' as out;

class SharedPreferences implements Repository {
  final Future<out.SharedPreferences> _prefs =
      out.SharedPreferences.getInstance();

  @override
  Future<int> getInt(String key) async {
    final prefs = await _prefs;

    try {
      return prefs.getInt(key) ?? 0;
    } catch (e) {
      throw 'Invalid key';
    }
  }

  @override
  Future<bool> saveInt(String key, int value) async {
    final prefs = await _prefs;

    return await prefs.setInt(key, value);
  }
}
