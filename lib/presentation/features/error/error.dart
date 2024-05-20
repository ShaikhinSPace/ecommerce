import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants/approuter.dart';
import 'package:flutter_ecommerce/presentation/features/home/home.dart';
import 'package:go_router/go_router.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppCOlors.primary,
      appBar: AppBar(
        backgroundColor: AppCOlors.primary,
        title: Center(
            child: Text(
          'error',
          style: TextStyle(color: Colors.red),
        )),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Error',
              style: TextStyle(color: Colors.red, fontSize: 50),
            ),
            FloatingActionButton(
                foregroundColor: AppCOlors.darkSecondary,
                child: Icon(Icons.arrow_back_ios),
                backgroundColor: AppCOlors.secondary,
                onPressed: () {
                  context.go(Approutes.homeRoute);
                })
          ],
        ),
      ),
    );
  }
}
