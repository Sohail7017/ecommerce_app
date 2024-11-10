import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_clone/data/repository/app_repository.dart';
import 'package:meta/meta.dart';

part 'decrement_item_event.dart';
part 'decrement_item_state.dart';

class DecrementItemBloc extends Bloc<DecrementItemEvent, DecrementItemState> {
  AppRepository appRepository;
  DecrementItemBloc({required this.appRepository}) : super(DecrementItemInitialState()) {
    on<GetDecrement>((event, emit) async{
      emit(DecrementItemLoadingState());
      try{
        var response =  await appRepository.decrementItems(bodyParams: event.bodyParams);
        if(response['status']){
          emit(DecrementItemLoadedState());
        }else{
          emit(DecrementItemErrorState(errMsg: response['message']));
        }
      }catch(e){
        emit(DecrementItemErrorState(errMsg: e.toString()));
      }
       });
  }
}
