part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class OnProfileLoadEvent extends ProfileEvent {
  OnProfileLoadEvent();

  @override
  List<Object> get props => [];
}
