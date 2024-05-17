part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object?> get props => [];
}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartLoaded extends CartState {
  final Cart? cart;
  CartLoaded(this.cart);

  @override
  List<Object?> get props => [cart];
}

final class CartFailed extends CartState {
  final String error;

  CartFailed(this.error);

  @override
  List<Object> get props => [error];
}
