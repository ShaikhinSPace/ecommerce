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
}
