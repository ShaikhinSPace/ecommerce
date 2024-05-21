import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter_ecommerce/authbloc/sharedprefsutil.dart';
import 'package:flutter_ecommerce/models/authUser.dart';
import 'package:flutter_ecommerce/models/cart_model.dart';
import 'package:flutter_ecommerce/models/products_model.dart';
import 'package:flutter_ecommerce/models/user_moel.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:ecom/models/product_model.dart';
// import 'package:flutter_ecommerce/models/products_model.dart';

class ApiProvider {
  // final String _url = ;
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://dummyjson.com'));

  Future<Products> fetchProducts() async {
    try {
      Response response = await _dio.get("/products");
      return Products.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<String>> fetchCategories() async {
    try {
      Response response = await _dio.get("/products/categories");
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<String> categories =
            data.map((category) => category.toString()).toList();
        return categories;
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

  Future<Products> fetchCategoryProduct(String category) async {
    // List<String>
    try {
      String categoryUrl = "/products/category/$category";
      Response response = await _dio.get(categoryUrl);
      return Products.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<Cart> fetchCart() async {
    User? data = await SharedPrefsUtils.getUser();
    int userid = data!.id;
    try {
      Response response = await _dio.get('/users/$userid/carts');
      print("response:: ${response.data}");
      return Cart.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthUser> fetchUser() async {
    User? data = await SharedPrefsUtils.getUser();
    String token = data!.token;
    try {
      Response response = await _dio.get('/auth/me',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return AuthUser.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<Cart> AddToCart(int cartid, int productid, int quantity) async {
    try {
      final Response response = await _dio.put('/carts/$cartid',
          data: {
            'merge': true,
            'products': [
              {"id": productid, "quantity": quantity}
            ]
          },
          options: Options(headers: {'Content-Type': 'application/json'}));
      print('cartdata::::${response.data}');
      return Cart.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}

// Future<Cart> delete(Int id) async{
//   await 
// }

// class SharedPrefsUtils {
//   static const String userDataKey = 'userData';

//   static Future<void> saveUserData(Map<String, dynamic> userData) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString(userDataKey, jsonEncode(userData));
//   }

//   static Future<Map<String,dynamic>> getUserdata()async { 
//     SharedPreferences sp = await SharedPreferences.ge
//   }
// }