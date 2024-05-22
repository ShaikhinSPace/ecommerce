import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/models/cart_model.dart';
import 'package:flutter_ecommerce/presentation/features/cart/bloc/cart_bloc.dart';
import 'package:flutter_ecommerce/presentation/features/home/home.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartBloc()..add(LoadCartEvent()),
      child: BlocListener<CartBloc, CartState>(
        listener: (context, state) {
          if (state is CartFail) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartInitial) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CartLoaded) {
              return _buildCart(context, state.cart);
            } else if (state is CartFail) {
              return Center(
                child: Text(state.message),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _buildCart(BuildContext context, Cart cart) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 3,
        color: AppCOlors
            .cardColor, // Ensure this color is defined in your AppColors class
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 450, // Set a fixed height for the GridView
                child: buildGrid(context, cart),
              ),
              _buildCheckout(context, cart),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGrid(BuildContext context, Cart model) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent:
            200, // Define the max cross axis extent for the grid items
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemCount: model.carts?.first.products?.length ?? 0,
      itemBuilder: (context, index) {
        final product = model.carts?.first.products?[index];
        return Card(
          color: AppCOlors.secondary,
          shadowColor: AppCOlors.CardBorder,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  product?.title ?? 'No title',
                  style: const TextStyle(
                    color: AppCOlors.PrimaryText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                    height: 100,
                    child: Image.network(product!.thumbnail ?? '')),
                const SizedBox(height: 5),
                Text(
                  'Price: \$${product?.discountedPrice?.toStringAsFixed(2) ?? '0.00'}',
                  style: TextStyle(color: AppCOlors.SecondaryText),
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        foregroundColor: MaterialStatePropertyAll(Colors.white),
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 255, 90, 78))),
                    onPressed: () {},
                    child: Icon(Icons.delete_rounded))
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCheckout(BuildContext context, Cart cart) {
    final totalPrice = cart.carts?.first.products?.fold<double>(
          0.0,
          (previousValue, product) =>
              previousValue + (product.discountedPrice ?? 0),
        ) ??
        0.0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Card(
        color: AppCOlors
            .primary, // Ensure this color is defined in your AppColors class
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: \$${totalPrice.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Add your checkout functionality here
                },
                child: const Text('Checkout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
