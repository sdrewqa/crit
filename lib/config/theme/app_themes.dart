import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'SF Pro Display',
      appBarTheme: appBarTheme(),
      textTheme: textTheme(),
      textButtonTheme: buttonTheme(),
      inputDecorationTheme: inputDecorationTheme());
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
      color: Color.fromARGB(255, 255, 255, 255),
      centerTitle: true,
      titleTextStyle: TextStyle(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
      iconTheme: IconThemeData(color: Colors.black));
}

TextTheme textTheme() {
  return const TextTheme(
      displayLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(0, 0, 0, 1)),
      displayMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Color.fromRGBO(130, 135, 150, 1)),
      displaySmall: TextStyle(
        fontSize: 14,
        color: Color.fromRGBO(13, 114, 255, 1),
        fontWeight: FontWeight.w500,
      ));
}

TextButtonThemeData buttonTheme() {
  return TextButtonThemeData(
    style: TextButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      foregroundColor: Colors.white,
      backgroundColor: const Color.fromRGBO(13, 114, 255, 1),
    ),
  );
}

InputDecorationTheme inputDecorationTheme() {
  return const InputDecorationTheme(
      labelStyle: TextStyle(
          color: Color.fromRGBO(169, 171, 183, 1),
          fontSize: 17,
          height: 5.2,
          fontWeight: FontWeight.w500),
      fillColor: Color.fromRGBO(246, 246, 249, 1),
      filled: true,
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.redAccent,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      disabledBorder: OutlineInputBorder(),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide.none));
}
