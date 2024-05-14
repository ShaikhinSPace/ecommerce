part of 'product_category_bloc.dart';

sealed class ProductCategoryState extends Equatable {
  const ProductCategoryState();

  @override
  List<Object> get props => [];
}

final class ProductCategoryInitial extends ProductCategoryState {}

class ProductCategoryLoading extends ProductCategoryState {}

class ProductCategoryLoaded extends ProductCategoryState {
  final Products products;
  ProductCategoryLoaded(this.products);

  @override
  List<Object> get props => [products];
}

class ProductCategoryError extends ProductCategoryState {
  final String message;
  ProductCategoryError(this.message);

  @override
  List<Object> get props => [message];
}
