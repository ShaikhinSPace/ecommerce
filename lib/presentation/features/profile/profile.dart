import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/authbloc/sharedprefsutil.dart';
import 'package:flutter_ecommerce/constants/approuter.dart';
import 'package:flutter_ecommerce/models/authUser.dart';
import 'package:flutter_ecommerce/models/user_moel.dart';
import 'package:flutter_ecommerce/presentation/features/home/home.dart';
import 'package:flutter_ecommerce/presentation/features/profile/bloc/profile_bloc.dart';
import 'package:go_router/go_router.dart';

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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        shadowColor: AppCOlors.CardBorder,
        color: AppCOlors.cardColor,
        // height: 500,
        // width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: AppCOlors.primary,
                radius: 50,
                child: ClipOval(child: Image.network(model.image ?? '')),
              ),
              Card(
                child: Column(
                  children: [
                    Text(
                      'Personal Details',
                      style: TextStyle(
                          color: AppCOlors.PrimaryText,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0 * 2),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Name',
                                style: TextStyle(color: AppCOlors.PrimaryText),
                              ),
                              Text(
                                "${model.firstName}" +
                                    ' ' +
                                    "${model.maidenName}" +
                                    ' ' +
                                    "${model.lastName}",
                                style:
                                    TextStyle(color: AppCOlors.SecondaryText),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Email',
                                style: TextStyle(color: AppCOlors.PrimaryText),
                              ),
                              Text(
                                "${model.email}",
                                style:
                                    TextStyle(color: AppCOlors.SecondaryText),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Username',
                                style: TextStyle(color: AppCOlors.PrimaryText),
                              ),
                              Text(
                                "${model.username}",
                                style:
                                    TextStyle(color: AppCOlors.SecondaryText),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Username',
                                style: TextStyle(color: AppCOlors.PrimaryText),
                              ),
                              Text(
                                "${model.age}",
                                style:
                                    TextStyle(color: AppCOlors.SecondaryText),
                              )
                            ],
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                  foregroundColor: MaterialStatePropertyAll(
                                      AppCOlors.secondary),
                                  backgroundColor: MaterialStatePropertyAll(
                                      AppCOlors.primary)),
                              onPressed: () {
                                SharedPrefsUtils.removeUser();
                                context.go(Approutes.loginRoute);
                              },
                              child: Text('Logout'))
                          //  Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Text(
                          //       'Username',
                          //       style: TextStyle(color: AppCOlors.PrimaryText),
                          //     ),
                          //     Text(
                          //       "${model.}",
                          //       style:
                          //           TextStyle(color: AppCOlors.SecondaryText),
                          //     )
                          //   ],
                          // ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
