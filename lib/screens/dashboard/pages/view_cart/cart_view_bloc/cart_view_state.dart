part of 'cart_view_bloc.dart';

@immutable
sealed class CartViewState {}

final class CartViewInitialState extends CartViewState {}
final class CartViewLoadingState extends CartViewState {}
final class CartViewLoadedState extends CartViewState {
  CartModel viewCartModel;
  CartViewLoadedState({required this.viewCartModel});

}
final class CartViewErrorState extends CartViewState {
  String errMsg;
  CartViewErrorState({required this.errMsg});
}
