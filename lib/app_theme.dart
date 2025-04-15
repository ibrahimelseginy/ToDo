import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static Color primaryColor = const Color(0xff5D9CEC);
  static Color primaryDark = const Color(0xff141A2E);
  static Color backgroundDark = const Color(0xff141A2E);
  static Color backgroundLight = const Color(0xffDFECDB);
  static Color black = const Color(0xff363636);
  static Color green = const Color(0xff61E757);
  static Color white = const Color(0xffF8F8F8);
  static Color red = Colors.red;
  static Color grey = const Color(0xffC8C9CB);
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: backgroundLight,
    primaryColor: primaryColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: primaryColor,
      backgroundColor: white,
      unselectedItemColor: grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
    ),
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      titleTextStyle: GoogleFonts.amiri(
        textStyle: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: white,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: primaryColor)),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: grey.withOpacity(0.8),
          width: 1,
        ),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: white,
      shape: CircleBorder(
        side: BorderSide(color: white, width: 2),
      ),
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.amiri(
        textStyle:
            TextStyle(color: white, fontSize: 30, fontWeight: FontWeight.bold),
      ),
      titleMedium: GoogleFonts.amiri(
        textStyle: const TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w800),
      ),
      bodyMedium: GoogleFonts.amiri(
        textStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: primaryColor,
        ),
      ),
      bodySmall: GoogleFonts.amiri(
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: black,
        ),
      ),
      bodyLarge: GoogleFonts.amiri(
        textStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: black,
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: primaryDark,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: green,
      backgroundColor: primaryDark,
      unselectedItemColor: white,
      type: BottomNavigationBarType.shifting,
    ),
    brightness: Brightness.dark,
    dividerTheme: DividerThemeData(color: green),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        titleTextStyle: GoogleFonts.amiri(
          textStyle: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: white,
          ),
        )),
    textTheme: TextTheme(
      headlineSmall: GoogleFonts.amiri(
        textStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w400,
          color: white,
        ),
      ),
      titleMedium: GoogleFonts.amiri(
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: green,
        ),
      ),
    ),
  );
}
