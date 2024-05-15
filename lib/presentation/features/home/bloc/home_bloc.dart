// import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants/Apirepo.dart';
import 'package:flutter_ecommerce/models/products_model.dart';
import 'package:bloc/bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(ProductInitial()) {
    final ApiRepo apiRepo = ApiRepo();

    on<LoadProductsEvent>((event, emit) async {
      try {
        emit(ProductLoading());
        final productList = await apiRepo.fetchProducts();
        print("list::${productList.products!.first}");
        emit(ProductLoaded(productList));
      } on NetworkError {
        emit(ProductError('error'));
      }
    });
  }
}
