import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/authbloc/authprovider.dart';
import 'package:flutter_ecommerce/authbloc/authrepo.dart';
import 'package:flutter_ecommerce/authbloc/sharedprefsutil.dart';
import 'package:flutter_ecommerce/constants/Apirepo.dart';
import 'package:flutter_ecommerce/models/user_moel.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    final AuthRepo authRepo = AuthRepo();

    on<LoginUserEvent>((event, emit) async {
      try {
        emit(AuthInitial());
        User user = await authRepo.loginUser(event.username, event.password);
        SharedPrefsUtils.saveUser(user);
        emit(AuthSuccess(user));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });

    // @override
    // Stream<AuthState> mapEventToState(AuthEvent event) async* {
    //   if (event is LoginUserEvent) {
    //     yield AuthInitial();
    //     try {
    //       User user = await authRepo.loginUser(event.username, event.password);
    //       yield AuthSuccess(user);
    //     } on DioException catch (e) {
    //       yield AuthFailure(e.toString());
    //     }
    //   }
    // }
  }
}
