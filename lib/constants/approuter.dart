import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/features/cart/cart.dart';
import 'package:flutter_ecommerce/features/categories/categories.dart';
import 'package:flutter_ecommerce/features/error/error.dart';
import 'package:flutter_ecommerce/features/home/home.dart';
import 'package:flutter_ecommerce/features/navigation/bloc/navigation_bloc.dart';
// import 'package:flutter_ecommerce/features/product/product.dart';
import 'package:flutter_ecommerce/features/profile/profile.dart';
import 'package:flutter_ecommerce/mainscreen.dart';
import 'package:go_router/go_router.dart';

abstract class Approutes {
  static const homeRoute = '/';
  static const cartRoute = '/cart';
  static const profileRoute = '/profile';
  static const categoriesRoute = '/categories';
  static const productRoute = '/product';
}

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    initialLocation: Approutes.homeRoute,
    navigatorKey: _rootNavigatorKey,
    routes: [
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
            ),
            GoRoute(
              path: Approutes.categoriesRoute,
              pageBuilder: (context, state) =>
                  NoTransitionPage(child: CategoriesScreen()),
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
            )
          ])
    ],
    errorBuilder: (context, state) => ErrorScreen(),
  );
  static void goBack() {
    _router.pop(_rootNavigatorKey.currentContext);
  }

  static GoRouter get router => _router;
}
