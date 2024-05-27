import 'package:flutter_ecommerce/constants/apiservice.dart';
import 'package:flutter_ecommerce/models/authUser.dart';
import 'package:flutter_ecommerce/models/cart_model.dart';
import 'package:flutter_ecommerce/models/category_model.dart';
import 'package:flutter_ecommerce/models/products_model.dart';

class ApiRepo {
  final _provider = ApiProvider();

  Future<Products> fetchProducts() {
    return _provider.fetchProducts();
  }

  Future<List<CategoryModel>> fetchCategories() {
    return _provider.fetchCategories();
  }

  Future<Cart> fetchCart() {
    return _provider.fetchCart();
  }

  Future<AuthUser> fetchAuthUser() {
    return _provider.fetchUser();
  }

  Future<Cart> addToCart(int cartid, int productId, int quantity) {
    return _provider.AddToCart(cartid, productId, quantity);
  }

  Future<Products> fetchCategoryProfucts(String url) {
    return _provider.fetchCategoryProduct(url);
  }
}

class NetworkError extends Error {}
