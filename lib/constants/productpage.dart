import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/products_model.dart';

class ProductPage extends StatelessWidget {
  final Product product;
  const ProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildProductCard(context, product),
    );
  }

  Widget _buildProductCard(BuildContext context, Product model) {
    return Card(
      child: Column(
        children: [_builTitle(model)],
      ),
    );
  }

  Widget _builTitle(Product model) {
    return Row(
      children: [Text(model.title!)],
    );
  }
}
