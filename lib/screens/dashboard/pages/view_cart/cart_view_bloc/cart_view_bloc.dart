import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_clone/data/models/cart_model.dart';
import 'package:ecommerce_app_clone/data/repository/app_repository.dart';
import 'package:meta/meta.dart';

part 'cart_view_event.dart';
part 'cart_view_state.dart';

class CartViewBloc extends Bloc<CartViewEvent, CartViewState> {
  AppRepository appRepository;
  CartViewBloc({required this.appRepository}) : super(CartViewInitialState()) {
    on<ShowCartDataEvent>((event, emit) async{
      emit(CartViewLoadingState());
      try{
        var response = await appRepository.getViewCart();
        if(response != null){
          emit(CartViewLoadedState(viewCartModel: CartModel.fromJson(response)));
        }else{
          emit(CartViewErrorState(errMsg: "No Data Loaded"));
        }
      }catch(e){
        emit(CartViewErrorState(errMsg: e.toString()));
      }



       });
  }
}
