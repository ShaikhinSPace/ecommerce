import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/constants/approuter.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit()
      : super(NavigationState(bottomNavItems: Approutes.homeRoute, index: 0));

  void getNavBarItem(int index) {
    switch (index) {
      case 0:
        emit(NavigationState(bottomNavItems: Approutes.homeRoute, index: 0));
        break;
      case 1:
        emit(NavigationState(
            bottomNavItems: Approutes.categoriesRoute, index: 1));

        break;
      case 2:
        emit(NavigationState(bottomNavItems: Approutes.cartRoute, index: 2));

        break;
      case 3:
        emit(NavigationState(bottomNavItems: Approutes.profileRoute, index: 3));

        break;
    }
  }
}
