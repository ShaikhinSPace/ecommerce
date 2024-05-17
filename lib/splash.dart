import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/authbloc/sharedprefsutil.dart';
import 'package:flutter_ecommerce/presentation/features/home/home.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SharedPrefsUtils sharedPrefsUtils = SharedPrefsUtils();
    Future.delayed(const Duration(seconds: 5), () async {
      final loggedin = await sharedPrefsUtils.isLoggedIn();
      context.go(loggedin ? '/home' : '/login');
    });
    return Scaffold(
      backgroundColor: AppCOlors.primary,
      body: Center(
        child: Image.asset('assets/logo.png'),
      ),
    );
  }
}
