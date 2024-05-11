import 'package:dio/dio.dart';
import 'package:flutter_ecommerce/models/products_model.dart';
// import 'package:ecom/models/product_model.dart';
// import 'package:flutter_ecommerce/models/products_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = 'https://dummyjson.com';

  Future<Products> fetchProducts() async {
    try {
      Response response = await _dio.get("${_url}/products");
      return Products.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
