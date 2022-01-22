import 'package:flutter/material.dart';
import 'package:flutter_store_app/app_colors.dart';
import 'package:flutter_store_app/components/theme.dart';
import 'package:flutter_store_app/pages/cart/cart_page.dart';
import 'package:flutter_store_app/pages/home/home_page.dart';
import 'package:flutter_store_app/pages/login/login_page.dart';
import 'package:flutter_store_app/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const LoginPage(),
        AppRoutes.homeRoute: (context) => const HomePage(),
        AppRoutes.loginRoute: (context) => const LoginPage(),
        AppRoutes.cartRoute: (context) => const CartPage()
      },
      theme: MyTheme().lightThemeData,
      themeMode: ThemeMode.light,
      darkTheme: MyTheme().dartThemeData,
    );
  }
}
