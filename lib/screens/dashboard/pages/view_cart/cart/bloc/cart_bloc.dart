import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_clone/data/repository/app_repository.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
AppRepository appRepository;

  CartBloc({required this.appRepository}) : super(CartInitialState()) {
    on<AddToCartEvent>((event, emit) async{
     emit(CartLoadingState());
     try{
       var response = await appRepository.addToCart(bodyParams: {
         "product_id":event.productId,
         "quantity":event.quantity
       });
       if(response['status'] || response['status']=='true'){
         emit(CartLoadedState());
       }else {
         emit(CartErrorState(errorMsg: response['message']));
       }


     }catch(e){
       emit(CartErrorState(errorMsg: e.toString()));
     }
    });
  }
}
