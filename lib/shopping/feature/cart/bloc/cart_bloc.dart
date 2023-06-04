import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_example/shopping/data/cart_item.dart';
import 'package:bloc_example/shopping/feature/home/model/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitialState()) {
    on<CartInitialEvent>(cartInitialEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) async {
    emit(CartLoadingState());
    await Future.delayed(const Duration(seconds: 4));
    emit(CartSucessState(cartItem: cartItems));
  }
}
