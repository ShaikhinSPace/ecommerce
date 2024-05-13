
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants/approuter.dart';
// import 'package:flutter_ecommerce/features/home/home.dart';
// import 'package:flutter_ecommerce/models/products_model.dart';

void main() async {
  // WidgetsFlutterBinding.ensureIni/tialized();
  // ApiRepo apiRepo = ApiRepo();
  // PrettyDioLogger();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      // routeInformationParser: appRouter.goRouter.routeInformationParser,
      // routerDelegate: appRouter.goRouter.routerDelegate,
      routerConfig: router,
    );
  }
}
