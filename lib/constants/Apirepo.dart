import 'package:flutter_ecommerce/constants/apiservice.dart';
import 'package:flutter_ecommerce/models/products_model.dart';

class ApiRepo {
  final _provider = ApiProvider();

  Future<Products> fetchProducts() {
    return _provider.fetchProducts();
  }
}

class NetworkError extends Error {}
