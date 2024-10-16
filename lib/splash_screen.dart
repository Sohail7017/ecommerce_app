import 'dart:async';

import 'package:ecommerce_app_clone/app_utility/ui_helper.dart';
import 'package:ecommerce_app_clone/screens/login_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));});
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: UiHelper.secondaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icons/app_logo.png',width: 150,height: 125,fit: BoxFit.fill,),
            Text('SHOP NOW',style: mTextStyle18(mFontWeight: FontWeight.bold,mColor: UiHelper.primaryColor),)
          ],
        ),
      ),
    );
  }
}