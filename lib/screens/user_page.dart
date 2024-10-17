import 'package:ecommerce_app_clone/app_utils/ui_helper.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UiHelper.quaternaryColor,
        centerTitle: true,
        title: Text('User',style: mTextStyle25(mColor: Colors.white),),
      ),
      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('User Page',style: mTextStyle28(),))

        ],),
    );
  }
}
