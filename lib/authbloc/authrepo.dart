import 'package:flutter_ecommerce/authbloc/authprovider.dart';
import 'package:flutter_ecommerce/models/user_moel.dart';

class AuthRepo {
  final _authProvider = AuthProvider();

  Future<User> loginUser(String username, String password) {
    return _authProvider.login(username, password);
  }
}
