part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishListButtonClickedEvent extends HomeEvent {
  final ProductDataModel clicketProduct;

  HomeProductWishListButtonClickedEvent({required this.clicketProduct});
}

class HomeProductCartButtonClickedEvent extends HomeEvent {
  final ProductDataModel clicketProduct;

  HomeProductCartButtonClickedEvent({required this.clicketProduct});
}

class HomeWishlistButtonNavigateEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}
