part of 'register_bloc.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitialState extends RegisterState {}
final class RegisterLoadingState extends RegisterState {}
final class RegisterSuccessState extends RegisterState {}
final class RegisterFailureState extends RegisterState {
  String? errorMsg;
  RegisterFailureState({required this.errorMsg});
}
