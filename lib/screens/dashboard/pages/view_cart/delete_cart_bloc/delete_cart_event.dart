part of 'delete_cart_bloc.dart';

@immutable
sealed class DeleteCartEvent {}
class DeleteCart extends DeleteCartEvent{
  Map<String,dynamic> bodyParams;
  DeleteCart({required this.bodyParams});
}
