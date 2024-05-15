import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/models/cart_model.dart';
import 'package:flutter_ecommerce/presentation/features/cart/bloc/cart_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    cartBloc.add(LoadCartEvent());
    super.initState();
  }

  @override
  void dispose() {
    cartBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cartBloc,
      child: BlocListener<CartBloc, CartState>(
        listener: (context, state) {
          if (state is CartError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartInitial) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CartLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CartLoaded) {
              // print("id:::${state.cart}");
              return buildCart(context, state.cart);
            } else if (state is CartError) {
              return Text('oops');
            }
            return Container();
          },
        ),
      ),
    );
  }
}

Widget buildCart(BuildContext context, Cart model) {
  return ListView.builder(
    itemCount: model.carts!.length,
    itemBuilder: (context, cartIndex) {
      return Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Cart ID: ${model.carts![cartIndex].id}'),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: model.carts![cartIndex].products!.length,
              itemBuilder: (context, productIndex) {
                return ListTile(
                  leading: Image.network(
                    model.carts![cartIndex].products![productIndex].thumbnail!,
                    width: 50,
                    height: 50,
                  ),
                  title: Text(
                    model.carts![cartIndex].products![productIndex].title!,
                  ),
                  subtitle: Text(
                    'Price: \$${model.carts![cartIndex].products![productIndex].price}',
                  ),
                );
              },
            ),
          ],
        ),
      );
    },
  );
}
