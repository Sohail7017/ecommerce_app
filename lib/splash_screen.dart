import 'dart:async';

import 'package:ecommerce_app_clone/app_utils/ui_helper.dart';
import 'package:ecommerce_app_clone/constant/app_constant.dart';
import 'package:ecommerce_app_clone/screens/auth/login/login_page.dart';
import 'package:ecommerce_app_clone/screens/dashboard/dashboard.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLight =false;

  @override
  void initState() {
    movePageTo();
    super.initState();

  }



  void movePageTo() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString(AppConstant.PREF_TOKEN_KEY) ?? "";
    Widget nextPage = LoginPage();
    if(token != "" ){

      nextPage = Dashboard();


    } Timer(Duration(seconds: 3), (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => nextPage));});


  }



  @override
  Widget build(BuildContext context) {
    isLight =  Theme.of(context).brightness == Brightness.light;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: isLight?UiHelper.secondaryColor:Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icons/app_logo.png',width: 150,height: 125,fit: BoxFit.fill,),
            Text('SHOP NOW',style: mTextStyle18(mFontWeight: FontWeight.bold,mColor: isLight?UiHelper.primaryColor:Colors.white),)
          ],
        ),
      ),
    );
  }
}