import 'package:ecommerce_app_clone/app_utils/ui_helper.dart';
import 'package:ecommerce_app_clone/constant/app_constant.dart';
import 'package:ecommerce_app_clone/main.dart';
import 'package:ecommerce_app_clone/screens/auth/login/login_page.dart';
import 'package:ecommerce_app_clone/screens/dashboard/pages/user/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  void initState() {
    context.read<UserBloc>().add(GetUserEvent());
     super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UiHelper.secondaryColor,
        centerTitle: true,
        title: Text('User',style: mTextStyle28(mFontWeight: FontWeight.bold),),
      ),
      body: BlocBuilder<UserBloc,UserState>(
          builder: (_,state){
            if(state is UserLoadingState){
              return Center(child: CircularProgressIndicator(),);
            }else if(state is UserErrorState){
              return Center(child: Text(state.errMsg),);
            }else if (state is UserLoadedState){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  SizedBox(
                    height: 60,
                  ),
                      Center(
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: UiHelper.quaternaryColor,
                            borderRadius: BorderRadius.circular(25)
                          ),
                          child: Center(child: Image.asset('assets/icons/user.png',width: 30,height: 30,)),
                        )
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(child: Text(state.userDataModel.data!.name!,style: mTextStyle18(mFontWeight: FontWeight.bold),)),
                    SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      width: double.infinity,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            leading: Icon(Icons.mail,color: Colors.red,),
                            title: Text('Mail',style: mTextStyle16(),),
                            trailing: Text(state.userDataModel.data!.email!,style: mTextStyle16(),),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: Container(
                              width: double.infinity,
                              height: 2,
                              color: Colors.grey.shade50,
                            ),
                          ),
                          ListTile(
                            leading: Icon(Icons.mobile_friendly),
                            title: Text('MobileNo',style: mTextStyle16(),),
                            trailing: Text("+91${state.userDataModel.data!.mobileNumber!}",style: mTextStyle16(),),
                          ),



                        ],
                      ),
                    ),
                  ),



                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: InkWell(
                      onTap: () async{
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                         prefs.setString(AppConstant.PREF_TOKEN_KEY,"");
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('LogOut SuccessFully!!')));


                      },
                      child: ListTile(

                        leading: Icon(Icons.logout),
                        title: Text('logOut',style: mTextStyle16(mFontWeight: FontWeight.w500),),
                      ),
                    ),
                  )


                ],);
            }
            return Container();
          })
    );
  }
}