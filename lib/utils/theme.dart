import 'package:flutter/material.dart';
import 'package:memogatari/utils/colors.dart';

ThemeData mainTheme() {
  final titleFont = 'Poppins';
  final bodyFont = 'Poppins';
  final accentColor = memoOrange;
  final primaryColor = memoRed;



  final Shader linearGradient = LinearGradient(
    colors: <Color>[memoRed, memoOrange],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 500.0, 70.0));

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
        fontSize: 16,
        foreground: Paint()..shader = linearGradient,
        background: Paint()..color = Colors.transparent,
        height: 1.1
      ),
      headline5: base.headline5.copyWith(
          fontFamily: titleFont,
          fontWeight: FontWeight.w900,
          fontSize: 28,
          foreground: Paint()..shader = linearGradient,
          background: Paint()..color = Colors.transparent,
          height: 1.1
      ),
      headline6: base.headline6.copyWith(
          fontFamily: titleFont,
          fontWeight: FontWeight.w900,
          fontSize: 18,
          color: Colors.black,
          height: 1.1
      ),
      overline: base.overline.copyWith(
          fontFamily: titleFont,
          fontWeight: FontWeight.w500,
          fontSize: 10,
          letterSpacing: 5,
          color: Colors.black54
      ),
      subtitle1: base.subtitle1.copyWith(
        fontFamily: bodyFont,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: Colors.white,
        height: 1.1
      ),
      subtitle2: base.subtitle2.copyWith(
          fontFamily: bodyFont,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: memoBodyColor,
          height: 1.1
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