import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/authbloc/sharedprefsutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ecommerce/authbloc/authprovider.dart';
import 'package:flutter_ecommerce/constants/approuter.dart';
import 'package:flutter_ecommerce/models/user_moel.dart';
import 'package:flutter_ecommerce/presentation/features/navigation/bloc/navigation_bloc.dart';
// import 'package:flutter_ecommerce/features/home/home.dart';
// import 'package:flutter_ecommerce/models/products_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsUtils.init();

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
