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
  onAddToCart();

  @override
  List<Object> get props => [];
}

class onRemoveFromCart extends CartEvent {
  onRemoveFromCart();

  @override
  List<Object> get props => [];
}
