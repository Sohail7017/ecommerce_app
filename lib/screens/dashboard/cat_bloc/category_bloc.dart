import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_clone/data/models/category_data_model.dart';
import 'package:ecommerce_app_clone/data/repository/app_repository.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  AppRepository appRepository;
  
  CategoryBloc({required this.appRepository}) : super(CategoryInitialSate()) {
    on<GetCategoryEvent>((event, emit) async{
      emit(CategoryLoadingSate());


      
      
      try{
        var response = await appRepository.getCategory();
        CategoryDataModel mCat = CategoryDataModel.fromJson(response);

        if(response['status']){
          emit(CategoryLoadedSate(mCategories: mCat.data!));
          
        }else{
          emit(CategoryErrorSate(errorMsg: response['message']));
        }
      }catch(e){
        emit(CategoryErrorSate(errorMsg: e.toString()));
      }
      
    });
  }
}
