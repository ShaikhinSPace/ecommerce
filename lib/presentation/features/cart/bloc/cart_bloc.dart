import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce/authbloc/sharedprefsutil.dart';
import 'package:flutter_ecommerce/constants/Apirepo.dart';
import 'package:flutter_ecommerce/models/cart_model.dart';
import 'package:flutter_ecommerce/models/user_moel.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<onAddToCart>((event, emit) async {
      try {
        emit(CartInitial());
        Cart? updatedCart =
            await ApiRepo().addToCart(event.userID, event.id, event.quantity);
        SharedPrefsUtils.removeCarts();
        SharedPrefsUtils.saveCart(updatedCart);
        final abc = await SharedPrefsUtils.getCart();
        print("cart======${abc?.carts![0].total}");
        emit(CartLoaded(abc));
      } catch (e) {
        emit(CartFailed(e.toString()));
      }
    });

    // @override
    // Stream<CartState> mapEventToState(CartEvent event) async* {
    //   if (event is onAddToCart) {
    //     Cart? updatedCart =
    //         await ApiRepo().addToCart(event.userID, event.id, event.quantity);
    //     SharedPrefsUtils.removeCarts();
    //     SharedPrefsUtils.saveCart(updatedCart);
    //     final abc = await SharedPrefsUtils.getCart();
    //     print("cart======${abc?.carts![0].total}");
    //     yield CartLoaded(abc);
    //   } else if (event is CartLoading) {
    //     yield CartLoading();
    //   } else {
    //     yield CartFailed('error');
    //   }
    // }
  }
}
