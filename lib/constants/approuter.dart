import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/authbloc/login.dart';
import 'package:flutter_ecommerce/authbloc/sharedprefsutil.dart';
import 'package:flutter_ecommerce/mainscreen.dart';
import 'package:flutter_ecommerce/presentation/features/ProductCategories/productCategory.dart';
import 'package:flutter_ecommerce/presentation/features/cart/cart.dart';
import 'package:flutter_ecommerce/presentation/features/categories/categories.dart';
import 'package:flutter_ecommerce/presentation/features/error/error.dart';
import 'package:flutter_ecommerce/presentation/features/home/home.dart';
import 'package:flutter_ecommerce/presentation/features/navigation/bloc/navigation_bloc.dart';
// import 'package:flutter_ecommerce/features/product/product.dart';
import 'package:flutter_ecommerce/presentation/features/profile/profile.dart';
import 'package:go_router/go_router.dart';

abstract class Approutes {
  static const homeRoute = '/';
  static const cartRoute = '/cart';
  static const profileRoute = '/profile';
  static const categoriesRoute = '/categories';
  static const productRoute = '/product';
  static const productCategory = 'products';
  static const loginRoute = '/login';
  static const searchROute = '/search';
}

abstract class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();
  static final bool sharedPrefsUtils = SharedPrefsUtils().isLoggedIn();
  // static final Future<bool> isLogin = SharedPrefsUtils.isLoggedIn();

  static final GoRouter _router = GoRouter(
    initialLocation: sharedPrefsUtils
        ? Approutes.homeRoute
        : Approutes.loginRoute, // Set initial location to loginRoute
    navigatorKey: _rootNavigatorKey,
    routes: <RouteBase>[
      GoRoute(
        path: Approutes.loginRoute,
        pageBuilder: (context, state) => NoTransitionPage(child: LoginScreen()),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return BlocProvider(
            create: (context) => NavigationCubit(),
            child: MainScreen(
              screen: child,
            ),
          );
        },
        routes: [
          GoRoute(
            path: Approutes.homeRoute,
            pageBuilder: (context, state) =>
                NoTransitionPage(child: HomeScreen()),
            // routes: [
            //   GoRoute(
            //       path: Approutes.searchROute,
            //       parentNavigatorKey: _shellNavigatorKey,
            //       builder: (context, state) => SearchPage())
            // ]

            // routes: [
            //   GoRoute(path: Approutes.productRoute,
            //   pageBuilder: (context, state) => ProductPage(product: product),)
            // ]
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: Approutes.categoriesRoute,
            pageBuilder: (context, state) =>
                NoTransitionPage(child: CategoriesScreen()),
            routes: [
              GoRoute(
                parentNavigatorKey: _shellNavigatorKey,
                path: Approutes.productCategory,
                builder: (context, state) => ProductCategoryScreen(),
              ),
            ],
          ),
          GoRoute(
            path: Approutes.cartRoute,
            pageBuilder: (context, state) =>
                NoTransitionPage(child: CartScreen()),
          ),
          GoRoute(
            path: Approutes.profileRoute,
            pageBuilder: (context, state) =>
                NoTransitionPage(child: ProfileScreen()),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => ErrorScreen(),
  );

  static void goBack() {
    _router.pop(_rootNavigatorKey.currentContext);
  }

  static GoRouter get router => _router;
}
