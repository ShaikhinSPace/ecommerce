import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce/constants/apiservice.dart';
import 'package:flutter_ecommerce/models/products_model.dart';

part 'product_category_event.dart';
part 'product_category_state.dart';

class ProductCategoryBloc
    extends Bloc<ProductCategoryEvent, ProductCategoryState> {
  final String category;
  ProductCategoryBloc(this.category) : super(ProductCategoryInitial()) {
    on<LoadCategoryProductEvent>((event, emit) async {
      try {
        emit(ProductCategoryInitial());
        final productlist = await ApiProvider().fetchCategoryProduct(category);
        emit(ProductCategoryLoaded(productlist));
      } catch (e) {
        emit(ProductCategoryError(e.toString()));
      }
    });
  }
}
