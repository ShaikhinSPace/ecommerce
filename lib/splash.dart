import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/presentation/features/home/home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppCOlors.primary,
      body: Center(
        child: Image.asset('assets/logo.png'),
      ),
    );
  }
}
