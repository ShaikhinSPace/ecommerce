import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce/authbloc/sharedprefsutil.dart';
import 'package:flutter_ecommerce/constants/Apirepo.dart';
import 'package:flutter_ecommerce/models/cart_model.dart';
import 'package:flutter_ecommerce/models/products_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    ApiRepo apiRepo = ApiRepo();
    on<AddToCartEvent>((event, emit) async {
      try {
        emit(CartLoading());
        final Cart cart = await apiRepo.addToCart(
            event.cartId, event.productid, event.quantity);
        final newcart = await SharedPrefsUtils.saveNewCart();
        final newnewCart = await SharedPrefsUtils.getNewCart();
        emit(CartLoaded(newnewCart!));
      } catch (e) {
        emit(CartError('message'));
      }
    });
  }
}
