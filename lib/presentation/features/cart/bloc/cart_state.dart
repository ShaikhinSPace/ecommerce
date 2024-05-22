part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

final class CartLoaded extends CartState {
  final Cart cart;
  CartLoaded(this.cart);
}

final class CartFail extends CartState {
  final String message;
  CartFail(this.message);

  @override
  List<Object> get props => [message];
}
