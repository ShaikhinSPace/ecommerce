import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants/Apirepo.dart';
import 'package:flutter_ecommerce/features/home/home.dart';
import 'package:flutter_ecommerce/models/products_model.dart';

void main() async {
  // log(productModels.toString());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
