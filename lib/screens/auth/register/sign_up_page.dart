import 'package:ecommerce_app_clone/app_utils/custom_text_field.dart';
import 'package:ecommerce_app_clone/app_utils/ui_helper.dart';

import 'package:ecommerce_app_clone/screens/auth/register/bloc/register_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';



class SignUpPage extends StatefulWidget{
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();

  TextEditingController mobController = TextEditingController();

  TextEditingController mailController = TextEditingController();

  TextEditingController passController = TextEditingController();

  bool isLoading = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                child: BlocListener<RegisterBloc, RegisterState>(
                listener: (context, state) {
                  if(state is RegisterLoadingState){
                    isLoading = true;
                    setState(() {

                    });
                  }else if(state is RegisterFailureState){
                    isLoading = false;
                    setState(() {

                    });
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${state.errorMsg}")));
                  }else if(state is RegisterSuccessState){
                    isLoading = false;
                    Navigator.pop(context);
                  }
                 },
                 child: ElevatedButton(onPressed: (){
                  var name = nameController.text;
                  var mobNo = mobController.text;
                  var mail = mailController.text;
                  var password = passController.text;

                  if(name.isNotEmpty && mobNo.isNotEmpty && mail.isNotEmpty && password.isNotEmpty){

                    context.read<RegisterBloc>().add(RegisterUserEvent(bodyParams: {
                      "name":name,
                      "mobile_number":mobNo,
                      "email":mail,
                      "password":password


                    }));

                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Fill  required fields')));
                  }


                    


                }, child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    isLoading ? CircularProgressIndicator(color: Colors.white,) :
                    Text('Sign Up',style: mTextStyle25(mColor: Colors.white,mFontWeight: FontWeight.bold),),
                  ],
                ),style: ElevatedButton.styleFrom(backgroundColor: UiHelper.primaryColor),),
),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: (){
              Navigator.pop(context);
                },
                child: Text('Already have a account',style: mTextStyle16(mFontWeight: FontWeight.w600),))
          ],
        ),
      ),
    );
  }
}