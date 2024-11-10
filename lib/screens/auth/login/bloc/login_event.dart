
abstract class LoginEvent{}

class UserAuthenticateEvent extends LoginEvent{
  String eMail;
  String pass;
  UserAuthenticateEvent({required this.eMail,required this.pass});
}