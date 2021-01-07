import 'package:flutter/material.dart';

ThemeData getTheme(BuildContext context) {
  const fontColor = Color.fromRGBO(69, 76, 96, 1);
  return ThemeData(
      primaryColor: Colors.grey,
      fontFamily: 'Mitr',
      textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 34.0, color: fontColor, fontWeight: FontWeight.w700),
        headline2: TextStyle(
          fontSize: 30.0,
          color: fontColor,
          fontWeight: FontWeight.w600,
        ),
        headline3: TextStyle(
          fontSize: 28.0,
          color: fontColor,
          fontWeight: FontWeight.w500,
        ),
        headline4: TextStyle(
          fontSize: 26.0,
          color: fontColor,
          fontWeight: FontWeight.w400,
        ),
        headline5: TextStyle(
          fontSize: 24.0,
          color: fontColor,
          fontWeight: FontWeight.w400,
        ),
        headline6: TextStyle(
          fontSize: 20.0,
          color: fontColor,
          fontWeight: FontWeight.w500,
        ),
        bodyText1: TextStyle(
            fontSize: 18.0, color: fontColor, fontWeight: FontWeight.w400),
        bodyText2: TextStyle(
            fontSize: 16.0, color: fontColor, fontWeight: FontWeight.w400),
        subtitle1: TextStyle(
            fontSize: 18.0, color: fontColor, fontWeight: FontWeight.w500),
        subtitle2: TextStyle(
            fontSize: 16.0, color: fontColor, fontWeight: FontWeight.w500),
        button: TextStyle(
            fontSize: 18.0, color: fontColor, fontWeight: FontWeight.w500),
        caption: TextStyle(
            fontSize: 16.0, color: fontColor, fontWeight: FontWeight.w400),
        overline: TextStyle(
            fontSize: 14.0, color: fontColor, fontWeight: FontWeight.w400),
      ),
      inputDecorationTheme: InputDecorationTheme(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
          border: new OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1))));
}
