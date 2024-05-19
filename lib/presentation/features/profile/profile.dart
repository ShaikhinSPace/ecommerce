import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/authbloc/sharedprefsutil.dart';
import 'package:flutter_ecommerce/models/authUser.dart';
import 'package:flutter_ecommerce/models/user_moel.dart';
import 'package:flutter_ecommerce/presentation/features/profile/bloc/profile_bloc.dart';

Future<User?> getUserData() async {
  final user = await SharedPrefsUtils.getUser();
  return user;
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileBloc profileBloc = ProfileBloc();
  @override
  void initState() {
    profileBloc.add(OnProfileLoadEvent());
    super.initState();
  }

  void dispose() {
    profileBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => profileBloc,
      child: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileInitial || state is ProfileLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ProfileLoaded) {
              return _buildProfile(context, state.authUser);
            } else if (state is ProfileError) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _buildProfile(BuildContext context, AuthUser model) {
    return Container(
      height: 500,
      width: MediaQuery.of(context).size.width,
      child: Text(model.firstName!),
    );
  }
}
