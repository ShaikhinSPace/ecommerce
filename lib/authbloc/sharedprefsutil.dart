import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants/apiservice.dart';
import 'package:flutter_ecommerce/models/cart_model.dart';
import 'package:flutter_ecommerce/models/products_model.dart';
import 'package:flutter_ecommerce/models/user_moel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsUtils {
  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<User> saveUser(User user) async {
    _preferences.setInt('userId', user.id);
    _preferences.setString('username', user.username);
    _preferences.setString('email', user.email);
    _preferences.setString('firstName', user.firstName);
    _preferences.setString('lastName', user.lastName);
    _preferences.setString('gender', user.gender);
    _preferences.setString('image', user.image);
    _preferences.setString('token', user.token);

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

  Future<bool> isLoggedIn() async {
    try {
      final token = _preferences.getString('token');
      return token?.isNotEmpty ?? false;
    } catch (e) {
      return false;
    }
  }

  static Future<void> removeUser() async {
    await _preferences.clear();
  }

  static Future<void> saveProducts(Products products) async {
    await _preferences.setString('products', jsonEncode(products.toJson()));
  }

  static Future<Products?> getProducts() async {
    String? productJson = await _preferences.getString('products');
    if (productJson != null) {
      return Products.fromJson(jsonDecode(productJson));
    }
    return null;
  }

  static Future<void> saveCategories(List<String> list) async {
    await _preferences.setStringList('categories', list);
  }

  static Future<List<String>> getCategories() async {
    List<String>? cats = await _preferences.getStringList('categories');
    if (cats != null) {
      return cats;
    }
    return [];
  }

  static Future<void> saveCart() async {
    Future<Cart> cartFuture = ApiProvider().fetchCart();
    Cart cart = await cartFuture;
    await _preferences.setString('cart', jsonEncode(cart));
  }

  static Future<Cart?> getCart() async {
    final cartJson = _preferences.getString('cart');
    if (cartJson == null) return null;
    return Cart.fromJson(jsonDecode(cartJson));
  }
}
