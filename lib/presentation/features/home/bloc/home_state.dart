part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class ProductInitial extends HomeState {}

class ProductLoading extends HomeState {}

class ProductError extends HomeState {
  final String error;
  const ProductError(this.error);

  @override
  List<Object> get props => [error];
}

class ProductLoaded extends HomeState {
  final Products? products;
  const ProductLoaded(this.products);

  @override
  List<Object?> get props => [products];
}
