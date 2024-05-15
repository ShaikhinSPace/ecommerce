part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginUserEvent extends AuthEvent {
  final String username;
  final String password;
  LoginUserEvent(this.username, this.password);

  @override
  List<Object> get props => [username, password];
}
