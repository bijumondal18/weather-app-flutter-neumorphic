import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  Future<void> setLocation(String locationName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('location_name', locationName);
  }

  Future<String> getLocation() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? locationName = prefs.getString('location_name');
    return locationName.toString();
  }
}
