import 'package:flutter/material.dart';
import 'package:memogatari/utils/colors.dart';

ThemeData mainTheme() {
  final titleFont = 'Playfair';
  final bodyFont = 'Poppins';
  final accentColor = memoOrange;
  final primaryColor = memoRed;

  TextTheme _basicTextTheme(TextTheme base) {
    return base.copyWith(
      headline4: base.headline4.copyWith(
        fontFamily: titleFont,
        fontWeight: FontWeight.w900,
        fontSize: 18,
        color: Colors.black87,
      ),
      headline5: base.headline5.copyWith(
          fontFamily: titleFont,
          fontWeight: FontWeight.w900,
          fontSize: 18,
          color: Colors.white
      ),
      headline6: base.headline6.copyWith(
          fontFamily: titleFont,
          fontWeight: FontWeight.w900,
          fontSize: 18,
          color: memoBrown
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