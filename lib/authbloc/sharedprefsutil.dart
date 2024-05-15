import 'package:flutter_ecommerce/models/user_moel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsUtils {
  Future saveUser(User user) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt('userId', user.id);
    sp.setString('username', user.username);
    sp.setString('email', user.email);
    sp.setString('firstName', user.firstName);
    sp.setString('lastName', user.lastName);
    sp.setString('gender', user.gender);
    sp.setString('image', user.image);
    sp.setString('token', user.token);
  }

  Future<User> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    try {
      int id = sp.getInt('userId') as int;
      String username = sp.getString('username') as String;
      String email = sp.getString('email') as String;
      String firstName = sp.getString('firstName') as String;
      String lastName = sp.getString('lastName') as String;
      String gender = sp.getString('gender') as String;
      String image = sp.getString('image') as String;
      String token = sp.getString('token') as String;
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

  void removeUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('id');
    sp.remove('username');
    sp.remove('email');
    sp.remove('firstName');
    sp.remove('lastName');
    sp.remove('gender');
    sp.remove('image');
    sp.remove('token');
  }
}
