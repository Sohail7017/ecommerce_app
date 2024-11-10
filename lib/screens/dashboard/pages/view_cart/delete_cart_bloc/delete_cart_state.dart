part of 'delete_cart_bloc.dart';

@immutable
sealed class DeleteCartState {}

final class DeleteCartInitialState extends DeleteCartState {}
final class DeleteCartLoadingState extends DeleteCartState {}
final class DeleteCartLoadedState extends DeleteCartState {}
final class DeleteCartErrorState extends DeleteCartState {
  String errMsg;
  DeleteCartErrorState({required this.errMsg});
}
