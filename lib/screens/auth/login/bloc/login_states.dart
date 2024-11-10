
abstract class LoginStates{}

class InitialLoginState extends LoginStates{}

class LoadingLoginState extends LoginStates{}

class SuccessLoginState extends LoginStates{}

class FailureLoginState extends LoginStates{
  String errMsg;
  FailureLoginState({required this.errMsg});
}