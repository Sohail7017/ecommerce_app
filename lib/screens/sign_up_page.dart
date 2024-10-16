import 'package:ecommerce_app_clone/app_utility/custom_text_field.dart';
import 'package:ecommerce_app_clone/app_utility/ui_helper.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget{
  var nameController = TextEditingController();
  var mobController = TextEditingController();
  var mailController = TextEditingController();
  var passController = TextEditingController();

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/icons/app_logo.png',width: 100,height: 100,fit: BoxFit.cover,),


              ],

            ),
            SizedBox(height: 15,),
            Center(child: Text("Now let's make you a Shop Now member",style: mTextStyle16(),)),


            CustomTextField.mTextField(
                mController: nameController,
                mText: 'User name',
            prefIcon: Icons.person),

            CustomTextField.mTextField(
              mController: mobController,
              mText: 'Mob No',
            preText: "+91",
            prefIcon: Icons.mobile_friendly),

            CustomTextField.mTextField(
              mController: mailController,
              mText: 'Mail',
            prefIcon: Icons.mail,
              sufText: '@gmail.com'),

            CustomTextField.mTextField(
              mController: passController,
              mText: 'Password',
            suffixIcon: Icons.remove_red_eye_outlined,
              prefIcon: Icons.password
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 45,
                child: ElevatedButton(onPressed: (){}, child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Sign Up',style: mTextStyle25(mColor: Colors.white,mFontWeight: FontWeight.bold),),
                  ],
                ),style: ElevatedButton.styleFrom(backgroundColor: UiHelper.primaryColor),),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(child: Text('Already have a account',style: mTextStyle16(mFontWeight: FontWeight.w600),))
          ],
        ),
      ),
    );
  }
}