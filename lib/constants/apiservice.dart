import 'package:dio/dio.dart';
import 'package:flutter_ecommerce/models/products_model.dart';
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

  Future<List> fetchCategories() async {
    List<String> categories = [];
    try {
      Response response = await _dio.get('/products/categories');
      print(response.data);
      return categories = [response.data];
    } catch (e) {
      rethrow;
    }
  }
}
