import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce/authbloc/sharedprefsutil.dart';
import 'package:flutter_ecommerce/models/authUser.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<OnProfileLoadEvent>((event, emit) async {
      try {
        emit(ProfileInitial());
        AuthUser user = await SharedPrefsUtils().getAuthUser();
        print('data::::::::${user.bank!.iban}');
        emit(ProfileLoaded(user));
      } catch (e) {
        emit(ProfileError('error'));
      }
    });
  }
}
