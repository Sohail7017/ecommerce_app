import 'package:ecommerce_app_clone/constant/app_constant.dart';
import 'package:ecommerce_app_clone/data/repository/app_repository.dart';
import 'package:ecommerce_app_clone/screens/auth/login/bloc/login_event.dart';
import 'package:ecommerce_app_clone/screens/auth/login/bloc/login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBloc extends Bloc<LoginEvent,LoginStates>{
  AppRepository appRepository;
  LoginBloc({required this.appRepository}) : super(InitialLoginState()){


    on<UserAuthenticateEvent>((event, emit) async{

      emit(LoadingLoginState());
      try{
       dynamic response =  await appRepository.authenticateUser(bodyParams: {
          "email": event.eMail,
          "password": event.pass,

        });
        if(response['status']){
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString(AppConstant.PREF_TOKEN_KEY, response["tokan"]);

          emit(SuccessLoginState());
        }else{
          emit(FailureLoginState(errMsg: response['message']));
        }
      }catch (e){
        emit(FailureLoginState(errMsg: e.toString()));
      }


    });
  }
}