import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/authbloc/bloc/auth_bloc.dart';
import 'package:flutter_ecommerce/authbloc/sharedprefsutil.dart';
import 'package:flutter_ecommerce/constants/approuter.dart';
import 'package:flutter_ecommerce/presentation/features/home/home.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AuthBloc(),
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            context.go(Approutes.homeRoute);
          },
          child: Scaffold(
            backgroundColor: AppCOlors.primary,
            // appBar: AppBar(
            //   title: Text('Login'),
            // ),
            body: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthInitial) {
                  return Center(child: LoginForm());
                } else if (state is AuthFailure) {
                  return Center(child: Text('Login failed: ${state.error}'));
                } else {
                  // Handle other states as needed
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ));
  }
}

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    FocusNode node1 = FocusNode();
    FocusNode node2 = FocusNode();

    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/banner.png'),
          Card(
            color: AppCOlors.cardColor,
            elevation: 5,
            shadowColor: AppCOlors.secondary,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    focusNode: node1,
                    controller: _usernameController,
                    decoration: InputDecoration(labelText: 'Username'),
                  ),
                  TextField(
                    focusNode: node2,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: false,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(AppCOlors.primary)),
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(context).add(LoginUserEvent(
                        _usernameController.text,
                        _passwordController.text,
                      ));
                      SharedPrefsUtils.getUser();
                      context.go(Approutes.homeRoute);
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
