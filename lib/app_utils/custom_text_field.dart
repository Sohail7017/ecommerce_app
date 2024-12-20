import 'package:ecommerce_app_clone/app_utils/ui_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField{


  static mTextField({
   required TextEditingController mController,
    required String mText,
    String? preText,
   String? sufText,
    IconData? suffixIcon,
     IconData? prefIcon,
    BuildContext? context,


  }

  ){
    bool isLight = context != null && Theme.of(context).brightness == Brightness.light;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
      child: TextField(
        controller: mController,


        decoration: InputDecoration(
          prefixIcon: Icon(prefIcon),
          labelText: mText,
          prefixText: preText,
          suffixText: sufText,

          suffixIcon: Icon(suffixIcon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: BorderSide(color: isLight?Colors.black:Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: BorderSide(color: isLight?Colors.black:Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: BorderSide(color: UiHelper.primaryColor),
          ),
        ),
      ),
    );
  }
}