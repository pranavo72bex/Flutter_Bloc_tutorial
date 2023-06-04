import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_example/shopping/data/cart_item.dart';
import 'package:bloc_example/shopping/data/grocery_data.dart';
import 'package:bloc_example/shopping/feature/home/model/home_product_data_model.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeProductWishListButtonClickedEvent>(
        homeProductWishListButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
    on<HomeInitialEvent>(homeInitialEvent);
  }
  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 4));
    emit(
      HoomeLoadedSuccessState(
        product: GroceryData.groceryProducts
            .map(
              (e) => ProductDataModel(
                id: e['id'],
                category: e['category'],
                name: e['name'],
                price: e['price'],
                quantity: e['quantity'],
              ),
            )
            .toList(),
      ),
    );
  }
}

FutureOr<void> homeProductCartButtonClickedEvent(
    HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
  cartItems.add(event.clicketProduct);
}

FutureOr<void> homeProductWishListButtonClickedEvent(
    HomeProductWishListButtonClickedEvent event, Emitter<HomeState> emit) {
  cartItems.add(event.clicketProduct);
}

FutureOr<void> homeWishlistButtonNavigateEvent(
    HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
  emit(HomeNavigateToWishlistPageActionState());
}

FutureOr<void> homeCartButtonNavigateEvent(
    HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
  emit(HomeNavigateToCartPageActionState());
}
