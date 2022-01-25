import 'package:flutter/material.dart';
import 'package:flutter_store_app/components/theme.dart';
import 'package:flutter_store_app/core/store/store.dart';
import 'package:flutter_store_app/pages/cart/cart_page.dart';
import 'package:flutter_store_app/pages/home/home_page.dart';
import 'package:flutter_store_app/pages/login/login_page.dart';
import 'package:flutter_store_app/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: MyStore(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => HomePage(),
        AppRoutes.homeRoute: (context) => HomePage(),
        AppRoutes.loginRoute: (context) => const LoginPage(),
        AppRoutes.cartRoute: (context) => CartPage()
      },
      theme: MyTheme().lightThemeData,
      themeMode: ThemeMode.light,
      darkTheme: MyTheme().dartThemeData,
    );
  }
}
