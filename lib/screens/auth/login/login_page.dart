import 'package:ecommerce_app_clone/main.dart';
import 'package:ecommerce_app_clone/screens/auth/login/bloc/login_bloc.dart';
import 'package:ecommerce_app_clone/screens/auth/login/bloc/login_event.dart';
import 'package:ecommerce_app_clone/screens/auth/login/bloc/login_states.dart';
import 'package:ecommerce_app_clone/screens/dashboard/dashboard.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app_utils/custom_text_field.dart';
import '../../../app_utils/ui_helper.dart';
import '../register/sign_up_page.dart';

class LoginPage extends StatefulWidget{
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var mailController = TextEditingController();

  var passController = TextEditingController();

  bool? isCheck = false;
  bool isLoading = false;
  bool isLight = false;

  @override
  Widget build(BuildContext context) {
    isLight = Theme.of(context).brightness==Brightness.light;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: isLight?UiHelper.secondaryColor:Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Center(child: Image.asset('assets/icons/app_logo.png',width: 150,height: 130,)),
            Center(child: Text('Shop Now',style: mTextStyle16(mFontWeight: FontWeight.bold,mColor: UiHelper.primaryColor)),),
            Text('Please enter your details to Log In.',style: mTextStyle14(mColor: isLight?Colors.black:Colors.white)),

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
                  Text('Remember Me ',style: mTextStyle14(mColor: isLight?Colors.black:Colors.white),),
                  SizedBox(
                    width: 60,
                  ),
                  Text('Forget Password?',style: mTextStyle16(mColor: isLight?Colors.black:Colors.white))


                ],
              ),
            ),

            SizedBox(height: 20,),
            BlocListener<LoginBloc, LoginStates>(
           listener: (context, state) {
                if(state is LoadingLoginState){
                  isLoading = true;
                  setState(() {

                  });
                }else if(state is FailureLoginState){
                  isLoading = false;
                  setState(() {

                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${state.errMsg}")));
                }else if(state is SuccessLoginState){
                  isLoading = false;
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard()));
                }
              },
              child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 45,
                child: ElevatedButton(onPressed: (){
                      var mail = mailController.text;
                      var pass = passController.text;
                      if(mail.isNotEmpty && pass.isNotEmpty){

                        context.read<LoginBloc>().add(UserAuthenticateEvent(
                            eMail: mail,
                            pass: pass));


                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Fill all required Fields")));
                      }
                       },
                  child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   isLoading ? CircularProgressIndicator() : Text('Log In',style: mTextStyle25(mColor: Colors.white,mFontWeight: FontWeight.bold),),

                 ],
                                ),style: ElevatedButton.styleFrom(backgroundColor: UiHelper.primaryColor),),
              ),
            ),
),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have a Account? ",style: mTextStyle16(mColor: isLight?Colors.black:Colors.white),),
                InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                    },
                    child: Text('Sign Up',style: mTextStyle16(mFontWeight: FontWeight.w600,mColor: isLight?Colors.black:Colors.white),)),
              ],
            )
          ],
        ),
      ),
    );
  }
}