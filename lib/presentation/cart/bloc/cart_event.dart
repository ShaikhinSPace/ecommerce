part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class onCartLoadEvent extends CartEvent {
  onCartLoadEvent();
  @override
  List<Object> get props => [];
}

class onAddToCart extends CartEvent {
  final int userID;
  final int id;
  final int quantity;
  onAddToCart(this.userID, this.id, this.quantity);

  @override
  List<Object> get props => [id, quantity, userID];
}

class onRemoveFromCart extends CartEvent {
  onRemoveFromCart();

  @override
  List<Object> get props => [];
}
