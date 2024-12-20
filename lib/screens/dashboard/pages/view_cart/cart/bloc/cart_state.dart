part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

 class CartInitialState extends CartState {}
class CartLoadingState extends CartState {}
class CartLoadedState extends CartState {}
class CartErrorState extends CartState {
  String errorMsg;
  CartErrorState({required this.errorMsg});
}
