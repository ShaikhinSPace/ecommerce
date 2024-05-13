import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/features/navigation/bloc/navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState.home);

  void goToHome() => emit(NavigationState.home);
    void goToCategories() => emit(NavigationState.categories);
      void goToCart() => emit(NavigationState.cart);
  void goToProfile() => emit(NavigationState.profile);


}
