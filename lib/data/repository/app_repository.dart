import 'package:ecommerce_app_clone/data/remote/api_helper.dart';
import 'package:ecommerce_app_clone/data/remote/urls.dart';

class AppRepository{
  ApiHelper apiHelper;
  AppRepository({required this.apiHelper});


  Future<dynamic> registerUser({required Map<String,dynamic> bodyParams}) async{


    try{
      var responseBody = await  apiHelper.postAPI(
          url: AppUrls.REGISTER_URL,
          isHeaderRequired: false,
          bodyParams: bodyParams);
      return responseBody;
    }catch (e){
      rethrow;
    }

  }


  Future<dynamic> authenticateUser({required Map<String,dynamic> bodyParams}) async{


    try{
      var responseBody =await apiHelper.postAPI(
          url: AppUrls.LOGIN_URL,
          isHeaderRequired: false,
          bodyParams: bodyParams
      );
      return responseBody;
    }catch(e){
      rethrow;
    }

  }


  /// PRODUCT DATA API HIT

  Future<dynamic> productData() async{

    try{
      var responseBody = await apiHelper.postAPI(
          url: AppUrls.PRODUCT_URL);
      return responseBody;
    }catch(e){
      rethrow;
    }

  }

  /// CATEGORY DATA API HIT

Future<dynamic> getCategory() async{
    try{
      var responseBody = await apiHelper.getAPI(url: AppUrls.CATEGORY_URL);
      return responseBody;
    }catch(e){
      rethrow;
    }
}


Future<dynamic> addToCart({required Map<String,dynamic> bodyParams}) async{
    try{
      var response = await apiHelper.postAPI(
        url: AppUrls.ADD_TO_CART,
        bodyParams: bodyParams,
      );
      return response;
    }catch(e){
      return;
    }
}

  Future<dynamic> getViewCart() async {
    try {
      dynamic responseBody = await apiHelper.getAPI(url: AppUrls.VIEW_CART);
      return responseBody;
    } catch (e) {
      rethrow;
    }
  }


  Future<dynamic> getUserDetail() async{
    try{
      dynamic responseBody = await apiHelper.postAPI(url: AppUrls.USER_DETAIL);
      return responseBody;
    }catch(e){
      rethrow;
    }
  }


  Future<dynamic> deleteCart({required Map<String,dynamic> bodyParams}) async{
    try{
    dynamic responseBody = await apiHelper.postAPI(url: AppUrls.DELETE_CART,bodyParams: bodyParams);
    return responseBody;
    }catch(e){
      rethrow;
    }
  }

  Future<dynamic> decrementItems({required Map<String,dynamic> bodyParams})async{
    try{
      dynamic responseBody = await apiHelper.postAPI(url: AppUrls.DECREMENT_QUANTITY,bodyParams: bodyParams);
      return responseBody;
    }catch(e){
      rethrow;
    }
  }

}