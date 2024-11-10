import 'package:ecommerce_app_clone/data/remote/api_helper.dart';
import 'package:ecommerce_app_clone/data/repository/app_repository.dart';
import 'package:ecommerce_app_clone/screens/auth/login/bloc/login_bloc.dart';
import 'package:ecommerce_app_clone/screens/auth/register/bloc/register_bloc.dart';
import 'package:ecommerce_app_clone/screens/dashboard/bloc/product_bloc.dart';
import 'package:ecommerce_app_clone/screens/dashboard/cat_bloc/category_bloc.dart';

import 'package:ecommerce_app_clone/screens/dashboard/pages/user/user_bloc/user_bloc.dart';
import 'package:ecommerce_app_clone/screens/dashboard/pages/view_cart/cart/bloc/cart_bloc.dart';
import 'package:ecommerce_app_clone/screens/dashboard/pages/view_cart/cart_view_bloc/cart_view_bloc.dart';
import 'package:ecommerce_app_clone/screens/dashboard/pages/view_cart/delete_cart_bloc/delete_cart_bloc.dart';

import 'package:ecommerce_app_clone/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) =>
        RegisterBloc(
        appRepository: AppRepository(
            apiHelper: ApiHelper()))),
    BlocProvider(create: (context) =>
        LoginBloc(appRepository: AppRepository(
            apiHelper: ApiHelper()))),
    BlocProvider(create: (context) =>
        ProductBloc(appRepository: AppRepository(
            apiHelper: ApiHelper()))),
    BlocProvider(create: (context) => CategoryBloc(appRepository: AppRepository(apiHelper: ApiHelper()))),
    BlocProvider(create: (context) => CartBloc(appRepository: AppRepository(apiHelper: ApiHelper()))),
    BlocProvider(create: (context)=> CartViewBloc(appRepository: AppRepository(apiHelper: ApiHelper()))),
    BlocProvider(create: (context) => UserBloc(appRepository: AppRepository(apiHelper: ApiHelper()))),
    BlocProvider(create: (context) => DeleteCartBloc(appRepository: AppRepository(apiHelper: ApiHelper())))
  ], child: const MyApp()));
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
