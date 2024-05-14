part of 'categories_bloc.dart';

sealed class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoading extends CategoriesState {}

final class CategoriesLoaded extends CategoriesState {
  final List categoryList;
  CategoriesLoaded(this.categoryList);

  @override
  List<Object> get props => [categoryList];
}

final class CategoriesError extends CategoriesState {
  final String message;
  CategoriesError(this.message);

  @override
  List<Object> get props => [message];
}
