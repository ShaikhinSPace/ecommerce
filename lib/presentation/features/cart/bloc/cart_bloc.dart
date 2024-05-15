import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce/constants/Apirepo.dart';
import 'package:flutter_ecommerce/models/cart_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    final ApiRepo apiRepo = ApiRepo();
    on<LoadCartEvent>((event, emit) async {
      try {
        emit(CartInitial());
        final cart = await apiRepo.fetchCart();
        print("cart:::${cart.carts!.length}");
        emit(CartLoaded(cart));
      } on NetworkError {
        emit(CartError('error'));
      }
    });
  }
}
