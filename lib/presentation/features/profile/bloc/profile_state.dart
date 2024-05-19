part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  final AuthUser authUser;
  const ProfileLoaded(this.authUser);

  @override
  List<Object> get props => [authUser];
}

final class ProfileError extends ProfileState {
  String message;
  ProfileError(this.message);

  @override
  List<Object> get props => [message];
}
