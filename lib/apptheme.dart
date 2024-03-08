import 'package:flutter/material.dart';

class AppTheme {
  static Color primaryColor = const Color(0xff5d9cec);
  static Color backgroundColorLight = const Color(0xffDFECDB);
  static Color backgroundColorDark = const Color(0xff060e1e);
  static Color greenColor = const Color(0xff61E757);
  static Color redColor = const Color(0xffEC4B4B);
  static Color balckColor = const Color(0xff141922);
  static Color greyColor = const Color(0xffC8C9CB);
  static Color whiteColor = const Color(0xffffffff);

  static ThemeData lightTheme = ThemeData(
      primaryColor: primaryColor,
      appBarTheme: AppBarTheme(
          backgroundColor: primaryColor,
          titleTextStyle: TextStyle(
              color: whiteColor, fontWeight: FontWeight.bold, fontSize: 22)),
      scaffoldBackgroundColor: backgroundColorLight,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: primaryColor,
        unselectedItemColor: greenColor,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        foregroundColor: whiteColor,
        shape: CircleBorder(side: BorderSide(color: whiteColor, width: 4)),
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w400, color: balckColor),
        bodyMedium: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor),
        bodySmall: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w600, color: balckColor),
      ));

  static ThemeData darkTheme = ThemeData(
      appBarTheme: AppBarTheme(
          backgroundColor: primaryColor,
          surfaceTintColor: backgroundColorDark));
}
