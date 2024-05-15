// import 'dart:convert';
import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_ecommerce/models/authusermodel.dart';
// import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/user_moel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://dummyjson.com'));

  Future<User> login(String username, String password) async {
    try {
      Response response = await _dio.post('/auth/login',
          data: {'username': username, 'password': password},
          options: Options(headers: {'Content-Type': 'application/json'}));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;
        print("Login successful! User: ${data}");
        String token = data['token'];
        int userID = data['id'];
        String username = data['username'];
        User user = User(
            id: userID,
            username: username,
            email: data['email'],
            firstName: data['firstName'],
            lastName: data['lastName'],
            gender: data['gender'],
            image: data['image'],
            token: token);

        return user;
      } else {
        print(e.toString());
      }
    } catch (e) {
      rethrow;
    }
    return User(
        id: 0,
        username: 'username',
        email: 'email',
        firstName: 'firstName',
        lastName: 'lastName',
        gender: 'gender',
        image: 'image',
        token: 'token');
  }

  Future<void> fetchUser(String token) async {
    try {
      Response response = await _dio.get('/auth/me',
          options: Options(headers: {'Authorization': 'Bearer ${token}'}));
      if (response.statusCode == 200) {
        final data = response.data;
        print('Login successful! User: ${data}');
      } else {
        print('failure: $e');
      }
    } catch (e) {
      print('error : $e');
    }
  }

  // Future<void> authenticate(String username, String password) async {
  //   User user = await login(username, password);
  //   await fetchUser(user.token);
  // }

  // Future<AuthUser> getData(String username, String password) async {
  //   try {
  //     await authenticate(username, password);
  //     return AuthUser.fromJson({});
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
