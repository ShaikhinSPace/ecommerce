part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class LoadCartEvent extends CartEvent {
  final Cart cart;
  LoadCartEvent(this.cart);

  @override
  List<Object> get props => [cart];
}

class AddToCartEvent extends CartEvent {
  final int cartId;
  final int productid;
  final int quantity;
  AddToCartEvent(this.cartId, this.productid, this.quantity);

  @override
  List<Object> get props => [cartId, productid, quantity];
}
