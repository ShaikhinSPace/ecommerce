import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce/authbloc/authrepo.dart';
import 'package:flutter_ecommerce/authbloc/sharedprefsutil.dart';
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
        await SharedPrefsUtils.saveUser(user);
        User? loggedinUser = await SharedPrefsUtils.getUser();
        // print("userData:::${loggedinUser.token != null ? true : false}");

        emit(AuthSuccess(loggedinUser));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });
  }
}
