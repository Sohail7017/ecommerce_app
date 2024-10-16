import 'package:ecommerce_app_clone/screens/home_page.dart';
import 'package:ecommerce_app_clone/screens/sign_up_page.dart';
import 'package:flutter/material.dart';

import '../app_utility/custom_text_field.dart';
import '../app_utility/ui_helper.dart';

class LoginPage extends StatefulWidget{
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var mailController = TextEditingController();

  var passController = TextEditingController();

  bool? isCheck = false;

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

            Center(child: Image.asset('assets/icons/app_logo.png',width: 150,height: 130,)),
            Center(child: Text('Shop Now',style: mTextStyle16(mFontWeight: FontWeight.bold,mColor: UiHelper.primaryColor)),),
            Text('Please enter your details to Log In.',style: mTextStyle14()),

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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Checkbox(value: isCheck,
                    activeColor: UiHelper.primaryColor,
                    tristate: false,
                    onChanged: (newBool){
                      setState(() {
                        isCheck = newBool;
                      });
                    },),
                  Text('Remember Me ',style: mTextStyle14(),),
                  SizedBox(
                    width: 60,
                  ),
                  Text('Forget Password?',style: mTextStyle16())


                ],
              ),
            ),

            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 45,
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                }, child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Log In',style: mTextStyle25(mColor: Colors.white,mFontWeight: FontWeight.bold),),
                  ],
                ),style: ElevatedButton.styleFrom(backgroundColor: UiHelper.primaryColor),),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have a Account? ",style: mTextStyle16(),),
                InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                    },
                    child: Text('Sign Up',style: mTextStyle16(mFontWeight: FontWeight.w600),)),
              ],
            )
          ],
        ),
      ),
    );
  }
}