import 'package:flutter_ecommerce/features/cart/cart.dart';
import 'package:flutter_ecommerce/features/categories/categories.dart';
import 'package:flutter_ecommerce/features/home/home.dart';
// import 'package:flutter_ecommerce/features/product/product.dart';
import 'package:flutter_ecommerce/features/profile/profile.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouteConstants {
  static const homeRoute = '/';
  static const cartRoute = '/cart';
  static const profileRoute = '/profile';
  static const categoriesRoute = '/categories';
  static const productRoute = '/product';
}

final router = GoRouter(initialLocation: AppRouteConstants.homeRoute, routes: [
  GoRoute(
    path: AppRouteConstants.homeRoute,
    builder: (context, state) => HomeScreen(),
    // routes: [GoRoute(path: AppRouteConstants.productRoute, builder: (context, state) => ProductScreen(product: ),)]
  ),
  GoRoute(
    path: AppRouteConstants.categoriesRoute,
    builder: (context, state) => CategoriesScreen(),
  ),
  GoRoute(
    path: AppRouteConstants.cartRoute,
    builder: (context, state) => CartScreen(),
  ),
  GoRoute(
    path: AppRouteConstants.profileRoute,
    builder: (context, state) => ProfileScreen(),
  )
]);
