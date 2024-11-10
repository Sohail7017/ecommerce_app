import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_clone/data/repository/app_repository.dart';
import 'package:meta/meta.dart';

part 'delete_cart_event.dart';
part 'delete_cart_state.dart';

class DeleteCartBloc extends Bloc<DeleteCartEvent, DeleteCartState> {
  AppRepository appRepository;
  DeleteCartBloc({required this.appRepository}) : super(DeleteCartInitialState()) {
    on<DeleteCart>((event, emit) async{
     emit(DeleteCartLoadingState());
     try{
       var cartData = await appRepository.deleteCart(
           bodyParams: event.bodyParams);
       if(cartData['status']){
        emit(DeleteCartLoadedState());
       }else{
         emit(DeleteCartErrorState(errMsg: cartData["message"]));
       }

     }catch(e){
       emit(DeleteCartErrorState(errMsg: e.toString()));
     }

       });
  }
}
