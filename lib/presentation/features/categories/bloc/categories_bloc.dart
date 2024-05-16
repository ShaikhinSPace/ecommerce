import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ecommerce/authbloc/sharedprefsutil.dart';
import 'package:flutter_ecommerce/constants/Apirepo.dart';
import 'package:flutter_ecommerce/models/products_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesInitial()) {
    final ApiRepo apiRepo = ApiRepo();
    on<LoadCategoriesEvent>((event, emit) async {
      try {
        emit(CategoriesLoading());
        final categoriesList = await SharedPrefsUtils.getCategories();
        emit(CategoriesLoaded(categoriesList));
      } on NetworkError {
        emit(CategoriesError('error'));
      }
    });
  }
}
