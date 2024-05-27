import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce/authbloc/sharedprefsutil.dart';
import 'package:flutter_ecommerce/constants/Apirepo.dart';
import 'package:flutter_ecommerce/models/category_model.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesInitial()) {
    ApiRepo apiRepo = ApiRepo();
    on<LoadCategoriesEvent>((event, emit) async {
      try {
        emit(CategoriesLoading());
        final categories = await SharedPrefsUtils.getCategoryList();

        emit(CategoriesLoaded(categories));
      } on NetworkError {
        emit(CategoriesError('error'));
      }
    });
  }
}
