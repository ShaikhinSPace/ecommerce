part of 'product_category_bloc.dart';

sealed class ProductCategoryState extends Equatable {
  const ProductCategoryState();
  
  @override
  List<Object> get props => [];
}

final class ProductCategoryInitial extends ProductCategoryState {}
