import 'package:ecommerce_app_clone/app_utils/ui_helper.dart';
import 'package:ecommerce_app_clone/screens/dashboard/pages/view_cart/cart_page.dart';

import 'package:ecommerce_app_clone/screens/dashboard/pages/home_page.dart';

import 'package:ecommerce_app_clone/screens/dashboard/pages/user/user_page.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
   @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool isLight = false;
  int currentTab = 0;
  final List<Widget> screens = [
    HomePage(),


    CartPage(),
    UserPage(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomePage();
  @override
  Widget build(BuildContext context) {
    isLight = Theme.of(context).brightness==Brightness.light;
    return Scaffold(
      body: PageStorage(
          bucket: bucket,
          child: currentScreen),

      bottomNavigationBar: BottomAppBar(
        color: isLight?UiHelper.secondaryColor:Colors.black,
        height: 70,
        elevation: 15,
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        child: Container(
          height: 30,

          child:    Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MaterialButton(
                  minWidth: 25,
                  onPressed: (){
                    setState(() {
                      currentScreen = HomePage();
                      currentTab =1;
                    });
                  },
                  child: Icon(Icons.home_outlined,size: 35,color: currentTab==1?UiHelper.primaryColor : Colors.grey.shade500,) ),
              MaterialButton(
                minWidth: 25,
                onPressed: (){
                  setState(() {
                    currentScreen = CartPage();
                    currentTab = 2;
                  });
                },
                child: Image.asset('assets/icons/cart.png',width: 35,height: 35,
                    fit: BoxFit.fill,color: currentTab == 2 ? UiHelper.primaryColor : Colors.grey.shade500),
              ),
              MaterialButton(
                minWidth: 25,
                onPressed: (){
                  setState(() {
                    currentScreen = UserPage();
                    currentTab = 3;
                  });
                },
                child: Image.asset('assets/icons/user.png',width: 30,height: 30,
                    fit: BoxFit.fill,color: currentTab == 3? UiHelper.primaryColor : Colors.grey.shade500),
              ),
            ],
          )




        ),
      ),
    );
  }
}
