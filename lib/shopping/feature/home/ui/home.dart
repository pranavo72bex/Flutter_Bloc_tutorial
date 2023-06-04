import 'package:bloc_example/shopping/feature/cart/ui/cart.dart';
import 'package:bloc_example/shopping/feature/home/bloc/home_bloc.dart';
import 'package:bloc_example/shopping/feature/home/ui/home_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../wishlist/ui/wishlist.dart';

class ShoppingExample extends StatefulWidget {
  const ShoppingExample({super.key});

  @override
  State<ShoppingExample> createState() => _ShoppingExampleState();
}

final HomeBloc homeBloc = HomeBloc();

class _ShoppingExampleState extends State<ShoppingExample> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) {
        return current is HomeActionState;
      },
      buildWhen: (previous, current) {
        return current is! HomeActionState;
      },
      listener: (context, state) {
        if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WishListPagge(),
            ),
          );
        } else if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CartPage(),
            ),
          );
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );

          case HoomeLoadedSuccessState:
            final sucessState = state as HoomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: const Text('HomeScreen'),
                actions: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeWishlistButtonNavigateEvent());
                    },
                    icon: const Icon(Icons.favorite_border_outlined),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeCartButtonNavigateEvent());
                    },
                    icon: const Icon(Icons.shopping_bag_outlined),
                  )
                ],
              ),
              body: ListView.builder(
                itemCount: sucessState.product.length,
                itemBuilder: (context, index) {
                  return HomeCard(
                    homeBloc: homeBloc,
                    productDataModel: sucessState.product[index],
                  );
                },
              ),
            );
          case HomeErrorState:
            return const Scaffold(
              body: Text('Errror occured'),
            );

          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
