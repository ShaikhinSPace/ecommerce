import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_ecommerce/authbloc/sharedprefsutil.dart';
import 'package:flutter_ecommerce/constants/Apirepo.dart';
import 'package:flutter_ecommerce/models/cart_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<onCartLoadEvent>((event, emit) async {
      try {
        emit(CartInitial());
        Cart? cart = await SharedPrefsUtils.getCart();

        emit(CartLoaded(cart));
      } catch (e) {
        emit(CartFailed(e.toString()));
      }
    });
  }
}
