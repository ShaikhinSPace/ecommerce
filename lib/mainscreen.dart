import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/constants/approuter.dart';
import 'package:flutter_ecommerce/constants/namednavbaritems.dart';
import 'package:flutter_ecommerce/features/home/home.dart';
import 'package:flutter_ecommerce/features/navigation/bloc/navigation_bloc.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatelessWidget {
  final Widget screen;
  MainScreen({super.key, required this.screen});

  final tabs = [
    NamedNavigationBarItemWidget(
        initialLocation: Approutes.homeRoute,
        icon: Icon(Icons.home),
        label: 'Home'),
    NamedNavigationBarItemWidget(
        initialLocation: Approutes.categoriesRoute,
        icon: Icon(Icons.grid_3x3),
        label: 'Categories'),
    NamedNavigationBarItemWidget(
        initialLocation: Approutes.cartRoute,
        icon: Icon(Icons.shopping_cart),
        label: 'Cart'),
    NamedNavigationBarItemWidget(
        initialLocation: Approutes.profileRoute,
        icon: Icon(Icons.man),
        label: 'Profile')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen,
      bottomNavigationBar: _buildBottomNavBar(tabs),
    );
  }

  _buildBottomNavBar(List<NamedNavigationBarItemWidget> tabs) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      buildWhen: (previous, current) => previous.index != current.index,
      builder: (context, state) {
        return BottomNavigationBar(
          backgroundColor: AppCOlors.primary,
          // fixedColor: AppCOlors.primary,
          selectedItemColor: Colors.white,
          unselectedItemColor: AppCOlors.secondary,
          onTap: (value) {
            if (state.index != value) {
              context.read<NavigationCubit>().getNavBarItem(value);
              context.go(tabs[value].initialLocation);
            }
          },
          items: tabs,
          type: BottomNavigationBarType.fixed,
        );
      },
    );
  }
}
