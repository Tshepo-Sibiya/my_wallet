import 'package:shared_preferences/shared_preferences.dart';

void saveData(String key, String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
  // You can use other methods like setInt, setDouble, setBool, etc., based on your data type.
}

Future<String?> fetchData(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(key) ?? "default_value";
}
