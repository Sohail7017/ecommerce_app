import 'package:ecommerce_app_clone/app_utils/ui_helper.dart';
import 'package:ecommerce_app_clone/screens/cart_page.dart';
import 'package:ecommerce_app_clone/screens/favourite_page.dart';
import 'package:ecommerce_app_clone/screens/home_page.dart';
import 'package:ecommerce_app_clone/screens/switch_page.dart';
import 'package:ecommerce_app_clone/screens/user_page.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
   @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentTab = 0;
  final List<Widget> screens = [
    HomePage(),
    SwitchPage(),
    FavouritePage(),
    CartPage(),
    UserPage(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
          bucket: bucket,
          child: currentScreen),
      floatingActionButton: FloatingActionButton(
        backgroundColor: currentScreen!=null ?UiHelper.primaryColor : Colors.white ,
          onPressed: (){
            setState(() {
              currentScreen = HomePage();
              currentTab ;
            });
          },
      child: Icon(Icons.home_outlined,size: 35,color: Colors.white,),
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: UiHelper.secondaryColor,
        height: 70,
        elevation: 10,
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        child: Container(
          height: 30,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  MaterialButton(
                    minWidth: 25,
                    onPressed: (){
                      setState(() {
                        currentScreen = SwitchPage();
                        currentTab = 1;
                      });
                    },
                    child: Image.asset('assets/icons/widget.png',width: 35,height: 35,
                        fit: BoxFit.fill,color: currentTab== 1 ? UiHelper.primaryColor : Colors.grey.shade500),
                  ),
                  MaterialButton(
                    minWidth: 25,
                    onPressed: (){
                      setState(() {
                        currentScreen = FavouritePage();
                        currentTab = 2;
                      });
                    },
                    child: Image.asset('assets/icons/like.png',width: 35,height: 35,
                        fit: BoxFit.fill,
                        color: currentTab == 2 ? UiHelper.primaryColor : Colors.grey.shade400),
                  ),
                ],
              ),
              Row(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 25,
                    onPressed: (){
                      setState(() {
                        currentScreen = CartPage();
                        currentTab = 3;
                      });
                    },
                    child: Image.asset('assets/icons/cart.png',width: 35,height: 35,
                        fit: BoxFit.fill,color: currentTab == 3 ? UiHelper.primaryColor : Colors.grey.shade500),
                  ),
                  MaterialButton(
                    minWidth: 25,
                    onPressed: (){
                      setState(() {
                        currentScreen = UserPage();
                        currentTab = 4;
                      });
                    },
                    child: Image.asset('assets/icons/user.png',width: 35,height: 35,
                        fit: BoxFit.fill,color: currentTab == 4 ? UiHelper.primaryColor : Colors.grey.shade500),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
