import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_ecommerce/authbloc/sharedprefsutil.dart';
import 'package:flutter_ecommerce/constants/Apirepo.dart';
import 'package:flutter_ecommerce/models/cart_model.dart';
import 'package:flutter_ecommerce/models/user_moel.dart';
import 'package:flutter_ecommerce/presentation/features/categories/bloc/categories_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<onCartLoadEvent>((event, emit) async {
      try {
        emit(CartInitial());
        Cart? cart = await SharedPrefsUtils.getCart();
        User? user = await SharedPrefsUtils.getUser();
        final int userid = user!.id;

        emit(CartLoaded(cart));
      } catch (e) {
        emit(CartFailed(e.toString()));
      }
    });

    Stream<CartState> mapEvenToState(CartEvent event) async* {
      ApiRepo apiRepo = ApiRepo();
      if (event is onAddToCart) {
        yield CartLoading();
        try {
          final Cart? cart =
              await apiRepo.addToCart(event.userID, event.id, event.quantity);
          if (cart != null) {
            yield CartLoaded(cart);
          } else {
            yield CartFailed('error');
          }
        } catch (e) {
          yield CartFailed('error');
        }
      }
    }

    ;
  }
}
