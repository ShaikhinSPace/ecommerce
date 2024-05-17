import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/authbloc/login.dart';
import 'package:flutter_ecommerce/authbloc/sharedprefsutil.dart';
import 'package:flutter_ecommerce/constants/apiservice.dart';
import 'package:flutter_ecommerce/mainscreen.dart';
import 'package:flutter_ecommerce/models/cart_model.dart';
import 'package:flutter_ecommerce/presentation/cart/bloc/cart_bloc.dart';
import 'package:flutter_ecommerce/presentation/cart/cart.dart';

import 'package:flutter_ecommerce/presentation/features/categories/bloc/categories_bloc.dart';
import 'package:flutter_ecommerce/presentation/features/home/bloc/home_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ecommerce/authbloc/authprovider.dart';
import 'package:flutter_ecommerce/constants/approuter.dart';
import 'package:flutter_ecommerce/models/user_moel.dart';
import 'package:flutter_ecommerce/presentation/features/navigation/bloc/navigation_bloc.dart';
import 'package:go_router/go_router.dart';
// import 'package:flutter_ecommerce/features/home/home.dart';
// import 'package:flutter_ecommerce/models/products_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsUtils.init();
  // // await SharedPrefsUtils.getUser();
  // ApiProvider apiProvider = ApiProvider();
  // final products = await apiProvider.fetchProducts();
  // SharedPrefsUtils.saveProducts(products);
  // final categories = await apiProvider.fetchCategories();
  // SharedPrefsUtils.saveCategories(categories);
  // final cart = await apiProvider.fetchCart();
  // print("data::::::${cart.carts![0].product![0].brand}");
  // SharedPrefsUtils.saveCart(cart);

  // await SharedPrefsUtils.isLoggedIn();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => HomeBloc(),
      ),
      BlocProvider(
        create: (context) => CategoriesBloc(),
      ),
      BlocProvider(
        create: (context) => CartBloc(),
        child: CartScreen(),
      )
    ],
    child: MyApp(),
  ));
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
