import 'package:ecommerce_app_clone/screens/cart_page.dart';
import 'package:ecommerce_app_clone/screens/explore_product.dart';
import 'package:ecommerce_app_clone/screens/home_page.dart';
import 'package:ecommerce_app_clone/screens/login_page.dart';
import 'package:ecommerce_app_clone/screens/sign_up_page.dart';
import 'package:ecommerce_app_clone/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
