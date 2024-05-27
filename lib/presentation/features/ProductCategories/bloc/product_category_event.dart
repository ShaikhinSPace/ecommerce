part of 'product_category_bloc.dart';

sealed class ProductCategoryEvent extends Equatable {
  const ProductCategoryEvent();

  @override
  List<Object> get props => [];
}

class LoadCategoryProductEvent extends ProductCategoryEvent {}
