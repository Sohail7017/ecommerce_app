part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitialState extends UserState {}
final class UserLoadingState extends UserState {}
final class UserLoadedState extends UserState {
  UserDataModel userDataModel;
  UserLoadedState({required this.userDataModel});
}
final class UserErrorState extends UserState {
  String errMsg;
  UserErrorState({required this.errMsg});
}
