part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState extends CartState {}

class CartInitialState extends CartState {}

class CartLoadingState extends CartState {}

class CartSucessState extends CartState {
  final List<ProductDataModel> cartItem;

  CartSucessState({required this.cartItem});
}
