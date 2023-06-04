import 'package:bloc_example/shopping/feature/cart/bloc/cart_bloc.dart';
import 'package:bloc_example/shopping/feature/cart/ui/cart_itemd_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Page'),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listener: (context, state) {},
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartLoadingState:
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            case CartSucessState:
              final sucessState = state as CartSucessState;
              return ListView.builder(
                  itemCount: sucessState.cartItem.length,
                  itemBuilder: (context, index) {
                    return CartCard(
                      cartBloc: cartBloc,
                      productDataModel: sucessState.cartItem[index],
                    );
                  });

            default:
              return const Text('Error');
          }
        },
      ),
    );
  }
}
