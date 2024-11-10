part of 'decrement_item_bloc.dart';

@immutable
sealed class DecrementItemState {}

final class DecrementItemInitialState extends DecrementItemState {}

final class DecrementItemLoadingState extends DecrementItemState {}

final class DecrementItemLoadedState extends DecrementItemState {}

final class DecrementItemErrorState extends DecrementItemState {
  String errMsg;
  DecrementItemErrorState({required this.errMsg});
}
