import 'package:flutter/rendering.dart';
import 'package:flutter_ecommerce/constants/apiservice.dart';
import 'package:flutter_ecommerce/models/authUser.dart';
import 'package:flutter_ecommerce/models/cart_model.dart';
import 'package:flutter_ecommerce/models/products_model.dart';

class ApiRepo {
  final _provider = ApiProvider();

  Future<Products> fetchProducts() {
    return _provider.fetchProducts();
  }

  Future<List> fetchCategories() {
    return _provider.fetchCategories();
  }

  Future<Products> fetchCategoryProducts(String category) async {
    return await _provider.fetchCategoryProduct(category);
  }

  Future<Cart> fetchCart() {
    return _provider.fetchCart();
  }

  Future<AuthUser> fetchAuthUser() {
    return _provider.fetchUser();
  }
}

class NetworkError extends Error {}
