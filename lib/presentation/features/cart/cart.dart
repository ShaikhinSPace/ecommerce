import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/models/cart_model.dart';
import 'package:flutter_ecommerce/presentation/features/cart/bloc/cart_bloc.dart';
import 'package:flutter_ecommerce/presentation/features/home/home.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // final CartBloc cartBloc = CartBloc();

  // @override
  // void initState() {
  //   cartBloc.add(onCartLoadEvent());
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   cartBloc.close();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartBloc(),
      child: BlocListener<CartBloc, CartState>(
        listener: (context, state) {
          if (state is CartFailed) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: BlocBuilder<CartBloc, CartState>(
          bloc: BlocProvider.of<CartBloc>(context),
          builder: (context, state) {
            if (state is CartInitial || state is CartLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CartLoaded) {
              return _buildCart(context, state.cart);
            } else if (state is CartFailed) {
              return Center(
                child: Text(state.error),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _buildCart(BuildContext context, Cart? model) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shadowColor: AppCOlors.CardBorder,
        elevation: 5,
        color: AppCOlors.secondary,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _buildTitle(context),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 400,
                width: 600,
                child: _buildList(context, model),
              ),
              SizedBox(
                height: 10,
              ),
              _buildCard(context, model),
              SizedBox(
                height: 10,
              ),
              _buildCheckOut(context, model)
            ],
          ),
        ),
      ),
    );
  }

  _buildTitle(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppCOlors.primary, borderRadius: BorderRadius.circular(8)),
      width: MediaQuery.of(context).size.width,
      // color: AppCOlors.primary,
      child: Center(
        child: Text(
          'CART',
          style: TextStyle(
              color: AppCOlors.secondary,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, Cart? cart) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 10 + 10 + 10 + 10 + 10 + 10 + 10,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: AppCOlors.primary),
        padding: const EdgeInsets.all(6),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    'Total Products',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    cart?.carts![0].totalProducts.toString() ?? '',
                    style: TextStyle(color: AppCOlors.secondary),
                  )
                ],
              ),
              VerticalDivider(),
              Column(
                children: [
                  Text(
                    'Total Quantity',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    cart?.carts![0].totalQuantity.toString() ?? '',
                    style: TextStyle(color: AppCOlors.secondary),
                  )
                ],
              ),
              VerticalDivider(),
              Column(
                children: [
                  Text(
                    'Total Price',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    cart?.carts![0].total.toString() ?? '',
                    style: TextStyle(color: AppCOlors.secondary),
                  )
                ],
              )
            ],
          ),
        ));
  }

  Widget _buildCheckOut(BuildContext context, Cart? cart) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: AppCOlors.primary),
      padding: const EdgeInsets.all(6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
              style: ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(AppCOlors.primary),
                  backgroundColor:
                      const MaterialStatePropertyAll(Colors.white)),
              onPressed: () {},
              child: Row(
                children: const [Text('CheckOut'), Icon(Icons.shopping_bag)],
              )),
          Column(
            children: [
              Text(
                'Discounted Total',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Text(
                " \$${cart?.carts?[0].discountedTotal.toString() ?? ''}",
                style: const TextStyle(color: AppCOlors.secondary),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildList(BuildContext context, Cart? model) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 0.6),
      itemCount: model?.carts?[0].products?.length,
      itemBuilder: (context, index) {
        return _buildCartItem(context, model, index);
      },
    );
  }

  Widget _buildCartItem(BuildContext context, Cart? model, int index) {
    final product = model?.carts?[0].products?[index];
    return SizedBox(
      height: 90,
      child: Card(
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Image.network(product?.thumbnail ?? '')),
            ),
            SizedBox(width: 120, child: Text(product?.title ?? '')),
            const SizedBox(
              width: 30,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: VerticalDivider(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // SizedBox(
                //   width: 5,
                // ),
                Text(
                  'Quantity :',
                  style: TextStyle(color: AppCOlors.PrimaryText),
                ),
                // SizedBox(
                //   width: 70,
                // ),
                Text(
                  "${product?.quantity.toString() ?? ""}",
                  style: TextStyle(color: AppCOlors.SecondaryText),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // SizedBox(
                //   width: 5,
                // ),
                Text(
                  'Total :',
                  style: TextStyle(color: AppCOlors.PrimaryText),
                ),
                // SizedBox(
                //   width: 70,
                // ),
                Text(
                  "${product?.total.toString() ?? ""}",
                  style: TextStyle(color: AppCOlors.SecondaryText),
                ),
              ],
            ),
            Divider(),
            FloatingActionButton.small(
              backgroundColor: Colors.red,
              onPressed: () {},
              child: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
