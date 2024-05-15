import 'package:flutter_ecommerce/models/user_moel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsUtils {
  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> saveUser(User user) async {
    _preferences.setInt('userId', user.id);
    _preferences.setString('username', user.username);
    _preferences.setString('email', user.email);
    _preferences.setString('firstName', user.firstName);
    _preferences.setString('lastName', user.lastName);
    _preferences.setString('gender', user.gender);
    _preferences.setString('image', user.image);
    _preferences.setString('token', user.token);
  }

  static Future<User?> getUser() async {
    try {
      int id = _preferences.getInt('userId') ?? 0;
      String username = _preferences.getString('username') ?? '';
      String email = _preferences.getString('email') ?? '';
      String firstName = _preferences.getString('firstName') ?? '';
      String lastName = _preferences.getString('lastName') ?? '';
      String gender = _preferences.getString('gender') ?? '';
      String image = _preferences.getString('image') ?? '';
      String token = _preferences.getString('token') ?? '';
      return User(
          id: id,
          username: username,
          email: email,
          firstName: firstName,
          lastName: lastName,
          gender: gender,
          image: image,
          token: token);
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<bool> isLoggedIn() async {
    var data = _preferences.getString('token');
    if (data!.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  static Future<void> removeUser() async {
    await _preferences.clear();
  }
}
