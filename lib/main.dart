import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ecommerce/authbloc/authrepo.dart';
import 'package:flutter_ecommerce/constants/approuter.dart';
import 'package:flutter_ecommerce/models/user_moel.dart';
import 'package:flutter_ecommerce/presentation/features/navigation/bloc/navigation_bloc.dart';
// import 'package:flutter_ecommerce/features/home/home.dart';
// import 'package:flutter_ecommerce/models/products_model.dart';

void main() async {
  group('AuthRepo', () {
    late AuthRepo authRepo;

    setUp(() {
      authRepo = AuthRepo();
    });
    String username = 'kminchelle';
    String password = '0lelplR';

    test('getData', () async {
      final authUser = await authRepo.login(username, password);
      return authUser;
    });
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final NavigationCubit navigationCubit;
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      routeInformationParser: AppRouter.router.routeInformationParser,
      routerDelegate: AppRouter.router.routerDelegate,
      // routerConfig: AppRoter,
    );
  }
}
