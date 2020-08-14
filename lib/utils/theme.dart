import 'package:flutter/material.dart';
import 'package:memogatari/utils/colors.dart';

ThemeData mainTheme() {
  final titleFont = 'Playfair';
  final bodyFont = 'Poppins';
  final accentColor = memoOrange;
  final primaryColor = memoRed;

  TextTheme _basicTextTheme(TextTheme base) {
    return base.copyWith(
      headline3: base.headline3.copyWith(
        fontFamily: titleFont,
        fontWeight: FontWeight.w900,
        fontSize: 28,
        color: Colors.white,
        height: 1.1
      ),
      headline4: base.headline4.copyWith(
        fontFamily: titleFont,
        fontWeight: FontWeight.w900,
        fontSize: 18,
        color: Colors.black87,
        height: 1.1
      ),
      headline6: base.headline6.copyWith(
          fontFamily: titleFont,
          fontWeight: FontWeight.w900,
          fontSize: 18,
          color: Colors.black38,
          height: 1
      ),
      overline: base.overline.copyWith(
          fontFamily: titleFont,
          fontWeight: FontWeight.w400,
          fontSize: 10,
          letterSpacing: 5,
          color: Colors.black38
      ),
      subtitle1: base.subtitle1.copyWith(
        fontFamily: bodyFont,
        fontWeight: FontWeight.w500,
        fontSize: 15,
        color: Colors.black38
      )
    );
  }

  final ThemeData base = ThemeData.light();

  return base.copyWith(
    textTheme: _basicTextTheme(base.textTheme),
    primaryColor: primaryColor,
    accentColor: accentColor,
    scaffoldBackgroundColor: memoBgColor,
  );
}