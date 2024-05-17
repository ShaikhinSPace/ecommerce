import 'package:flutter_ecommerce/models/cart_model.dart';
import 'package:flutter_ecommerce/models/products_model.dart';

extension ProductConversion on Product {
  CartProduct toCartProduct() {
    return CartProduct(
        id: id,
        title: title,
        price: price,
        quantity: null,
        total: null,
        discountPercentage: discountPercentage,
        discountedPrice: null,
        thumbnail: thumbnail);
  }
}

extension CartProductConversion on CartProduct {
  Product toProduct() {
    return Product(
      id: id,
      title: title,
      description: null,
      price: price,
      discountPercentage: discountPercentage,
      rating: null,
      stock: null,
      brand: null,
      category: null,
      thumbnail: thumbnail,
      images: null,
    );
  }
}
