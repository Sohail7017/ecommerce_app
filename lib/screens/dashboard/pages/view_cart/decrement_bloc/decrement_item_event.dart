part of 'decrement_item_bloc.dart';

@immutable
sealed class DecrementItemEvent {}

class GetDecrement extends DecrementItemEvent{
  Map<String,dynamic> bodyParams;
  GetDecrement({required this.bodyParams});
}
