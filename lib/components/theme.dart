import 'package:flutter/material.dart';
import 'package:flutter_store_app/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  ThemeData get lightThemeData => ThemeData(
      primarySwatch: appMaterialPrimary,
      appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: appPrimaryColor),
          titleTextStyle: TextStyle(color: appPrimaryColor)),
      fontFamily: GoogleFonts.poppins().fontFamily);

  ThemeData get dartThemeData => ThemeData(
      primarySwatch: appMaterialPrimary,
      cardColor: Colors.black,
      canvasColor: darkCreamColor,
      splashColor: lightBluishColor,
      appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white)),
      fontFamily: GoogleFonts.poppins().fontFamily);
}
