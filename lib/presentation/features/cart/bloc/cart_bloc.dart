import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce/authbloc/sharedprefsutil.dart';
import 'package:flutter_ecommerce/models/cart_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<LoadCartEvent>((event, emit) async {
      try {
        emit(CartInitial());
        final cart = await SharedPrefsUtils.getCart();
        if (cart != null) {
          emit(CartLoaded(cart));
        } else {
          emit(CartFail('Failed to load cart'));
        }
      } catch (e) {
        emit(CartFail('An error occurred: $e'));
      }
    });
  }
}
