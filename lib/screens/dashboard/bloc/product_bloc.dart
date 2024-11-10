import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_clone/data/models/product_data_model.dart';
import 'package:ecommerce_app_clone/data/repository/app_repository.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {

  AppRepository appRepository;
  ProductBloc({required this.appRepository}) : super(ProductInitialState()) {
    on<GetProductEvent>((event, emit) async{

     emit(ProductLoadingState());
    try {
      
       var response = await appRepository.productData();
       ProductDataModel mData = ProductDataModel.fromJson(response);

       if(response['status']){
         emit(ProductLoadedState(mProducts: mData.data!));
        
      }else{
        emit(ProductErrorState(errorMsg: response['message']));
      }


    }catch(e){
      emit(ProductErrorState(errorMsg: e.toString()));
    }
      });
  }
}
