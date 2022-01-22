import 'package:flutter/material.dart';
import 'package:flutter_store_app/app_colors.dart';
import 'package:flutter_store_app/components/theme.dart';
import 'package:flutter_store_app/pages/home/home_page.dart';
import 'package:flutter_store_app/pages/login/login_page.dart';
import 'package:flutter_store_app/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",
      routes: {
        "/": (context) => const LoginPage(),
        AppRoutes.homeRoute: (context) => const HomePage(),
        AppRoutes.loginRoute: (context) => const LoginPage()
      },
      theme: MyTheme().lightThemeData,
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(brightness: Brightness.dark),
    );
  }
}
