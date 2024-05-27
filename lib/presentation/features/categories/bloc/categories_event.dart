part of 'categories_bloc.dart';

sealed class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object> get props => [];
}

class LoadCategoriesEvent extends CategoriesEvent {}

class CategorySelectedEvent extends CategoriesEvent {
  final String categoryUrl;
  CategorySelectedEvent(this.categoryUrl);

  @override
  List<Object> get props => [categoryUrl];
}
