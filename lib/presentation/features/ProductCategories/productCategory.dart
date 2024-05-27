import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/presentation/features/home/home.dart';

class ProductCategoryScreen extends StatefulWidget {
  const ProductCategoryScreen({super.key});

  @override
  State<ProductCategoryScreen> createState() => _ProductCategoryScreenState();
}

class _ProductCategoryScreenState extends State<ProductCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppCOlors.accent,
      child: Text('hello'),
    );
  }
}
