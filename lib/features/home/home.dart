import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants/approuter.dart';
// import 'package:flutter_ecommerce/constants/custom_card.dart'; // Corrected import
import 'package:flutter_ecommerce/constants/custoomcard.dart';
// import 'package:flutter_ecommerce/constants/math.dart'; // Corrected import
import 'package:flutter_ecommerce/constants/maths.dart';
import 'package:flutter_ecommerce/features/home/bloc/home_bloc.dart';
// import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/models/products_model.dart';
import 'package:go_router/go_router.dart';

class AppCOlors {
  static const Color primary = Color(0xff93DEFF);
  static const Color secondary = Color(0xffF7F7F7);

  static const Color darkPrimary = Color(0xff32643);
  static const Color darkSecondary = Color(0xff606470);
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key); // Corrected key parameter

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(LoadProductsEvent());
    super.initState();
  }

  @override
  void dispose() {
    homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          // endDrawer: Drawer,
          drawer: Drawer(
            child: Column(
              children: [
                DrawerHeader(
                  child: Text('Hello'),
                  // curve: SawTooth(100),
                ),
                CircleAvatar(
                  child: FlutterLogo(),
                ),
                InkWell(
                  onTap: () {
                    context.go(AppRouteConstants.categoriesRoute);
                  },
                  child: ListTile(
                    title: Text('Categories'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.go(AppRouteConstants.cartRoute);
                  },
                  child: ListTile(
                    title: Text('Cart'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.go(AppRouteConstants.profileRoute);
                  },
                  child: ListTile(
                    title: Text('Profile'),
                  ),
                )
              ],
            ),
          ),
          backgroundColor: AppCOlors.secondary,
          // drawer: Drawer(),
          // appBar: AppBar(
          //   title: Text('hello'),
          // ),
          body: CustomScrollView(physics: BouncingScrollPhysics(), slivers: [
            SliverAppBar(
              toolbarHeight: 100,
              // shape: BeveledRectangleBorder(),
              centerTitle: true,
              backgroundColor: AppCOlors.primary,
              stretch: true,
              elevation: 50,
              title: Text('Amazon Lite'),
              actions: [
                InkWell(
                  onTap: () {
                    context.go(AppRouteConstants.cartRoute);
                  },
                  child: Icon(Icons.shopping_cart),
                )
              ],
            ),
            SliverToBoxAdapter(
                child: Container(
                    height: 730,
                    width: MediaQuery.of(context).size.width,
                    child: buildBloc()))
          ])),
    );
  }

  Widget buildBloc() {
    return BlocProvider(
        create: (context) => homeBloc,
        child: BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is ProductError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is ProductInitial) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ProductLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ProductLoaded) {
                return _buildCard(context, state.products);
              } else if (state is ProductError) {
                return Container(
                  child: Text('oops'),
                );
              } else {
                return Container();
              }
            },
          ),
        ));
  }

  Widget _buildCard(BuildContext context, Products model) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.8),
        itemCount: model.products!.length,
        itemBuilder: (context, index) {
          final String title = model.products![index].title ?? '';
          final int price = model.products![index].price ?? 0;
          final String rating = model.products![index].rating.toString();
          final int discountpercent =
              model.products![index].discountPercentage!.toInt();
          final String discountedprice =
              calculatePrice(discountpercent, price).toString();
          final String image = model.products![index].thumbnail ?? '';
          return CustomCard(
            name: title,
            discountPercent: discountpercent,
            discountedprice: discountedprice,
            image: image,
            price: price,
            rating: rating,
            product: model.products![index],
          );
        });
  }
}
