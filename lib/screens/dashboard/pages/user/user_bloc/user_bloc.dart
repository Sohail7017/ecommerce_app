import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_clone/data/models/user_data_model.dart';
import 'package:ecommerce_app_clone/data/repository/app_repository.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  AppRepository appRepository;
  UserBloc({required this.appRepository}) : super(UserInitialState()) {
    on<GetUserEvent>((event, emit) async{
      emit(UserLoadingState());
      try{
        var userDetails = await appRepository.getUserDetail();
        if(userDetails!= null){
          emit(UserLoadedState(userDataModel: UserDataModel.fromJson(userDetails)));
        }else{
          emit(UserErrorState(errMsg: "No User data found..."));
        }

      }catch(e){
        emit(UserErrorState(errMsg: e.toString()));
      }



    });
  }
}
