import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_clone/data/repository/app_repository.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  AppRepository appRepository;


  RegisterBloc({required this.appRepository}) : super(RegisterInitialState()) {


    on<RegisterUserEvent>((event, emit) async{
      emit(RegisterLoadingState());

      try{
        dynamic data = await appRepository.registerUser(bodyParams: event.bodyParams);
        if(data['status']){
          emit(RegisterSuccessState());
        }else{
          emit(RegisterFailureState(errorMsg: data["message"]) );
        }
      }catch (e){
        emit(RegisterFailureState(errorMsg: e.toString()));
      }
    });
  }
}
