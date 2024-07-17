import 'package:cardealership/helpers/my_var.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: primaryFontFamily,
    appBarTheme: const AppBarTheme(backgroundColor: primaryDark),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
          fontSize: 25, color: whiteColor, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(
        color: whiteColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(
        color: whiteColor,
        fontSize: 15,
      ),
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(whiteColor),
            backgroundColor: MaterialStatePropertyAll(aceentDark),
            overlayColor: MaterialStatePropertyAll(primaryDark))),
    drawerTheme: const DrawerThemeData(backgroundColor: backgroundDark));

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  fontFamily: primaryFontFamily,
  appBarTheme: const AppBarTheme(backgroundColor: primaryLight),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
        fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    bodySmall: TextStyle(
      color: whiteColor,
      fontSize: 15,
    ),
  ),
  elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
          foregroundColor: MaterialStatePropertyAll(whiteColor),
          backgroundColor: MaterialStatePropertyAll(aceentLight),
          overlayColor: MaterialStatePropertyAll(redColor))),
  drawerTheme: const DrawerThemeData(backgroundColor: whiteColor),
);
