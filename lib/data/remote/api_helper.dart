import 'dart:convert';
import 'dart:io';

import 'package:ecommerce_app_clone/constant/app_constant.dart';
import 'package:ecommerce_app_clone/data/remote/app_exception.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class ApiHelper{

  Future<dynamic> getAPI({required String url, bool isHeaderRequired = true}) async{
    var uri = Uri.parse(url);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString(AppConstant.PREF_TOKEN_KEY) ?? "";
    
    
    try{
      var res = await http.get(uri,headers: isHeaderRequired ? {
        "Authorization":"Bearer ${token}"
      }: null);
      return returnJSonResponse(res);
    }on SocketException catch(e){
      throw(FetchDataException(errMsg: "No Internet"));
    }
  }



  Future<dynamic> postAPI({required String url, bool isHeaderRequired = true, Map<String,dynamic>? bodyParams}) async{
    var uri = Uri.parse(url);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString(AppConstant.PREF_TOKEN_KEY)?? "";


    try{
      var res = await http.post(uri,headers: isHeaderRequired ? {
        "Authorization" : "Bearer $token"
      }: null, body: jsonEncode(bodyParams ?? {}));
      return returnJSonResponse(res);
    }on SocketException catch(e){
      throw(FetchDataException(errMsg: "No Internet"));
    }
  }






  dynamic returnJSonResponse(http.Response response){

    switch(response.statusCode){

      case 200:{
        var mData = jsonDecode(response.body);
        return mData;
      }
      case 300:
      case 400:
        throw BadRequestException(errMsg: response.body.toString());
      case 401:
      case 403:
        throw UnAuthorisedException(errMsg: response.body.toString());
      case 500:
      case 502:
      default:
        throw FetchDataException(errMsg: "Error occured while Communicaton with server with statuscode:  ${response.body.toString()} ");
    }
  }

}