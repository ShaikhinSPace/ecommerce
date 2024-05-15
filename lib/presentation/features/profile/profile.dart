import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/authbloc/sharedprefsutil.dart';
import 'package:flutter_ecommerce/models/user_moel.dart';

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
  Future<User?>? _user;
  @override
  void initState() {
    super.initState();
    _user = getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello'),
      ),
      body: FutureBuilder(
          future: _user,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final user = snapshot.data!;
              return Column(
                children: [
                  Text(user.email),
                  CircleAvatar(
                    radius: 50,
                    child: Image.network(
                      user.image,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error'),
              );
            }
            return Text('Error');
          }),
    );
  }
}
