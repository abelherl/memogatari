import 'package:flutter/material.dart';
import 'package:memogatari/shared/constant_styling.dart';

ThemeData mainTheme() {
  final fontFamily = mFontFamily;
  final primaryColor = memoRed;
  final accentColor = memoOrange;

  TextTheme _basicTextTheme(TextTheme base) {
    return base.copyWith(
      headline1: base.headline1.copyWith(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w700,
        color: memoDarkTextColor,
      ),
      headline2: base.headline2.copyWith(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w700,
        color: memoDarkTextColor,
      ),
      headline3: base.headline3.copyWith(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w700,
        color: memoDarkTextColor,
      ),
      headline4: base.headline4.copyWith(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 30,
        color: memoDarkTextColor,
      ),
      headline5: base.headline5.copyWith(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w700,
        color: memoDarkTextColor,
      ),
      headline6: base.headline6.copyWith(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 18,
        color: memoDarkTextColor,
      ),
      bodyText1: base.bodyText1.copyWith(
        fontFamily: fontFamily,
        color: memoDarkTextColor,
      ),
      bodyText2: base.bodyText2.copyWith(
        fontFamily: fontFamily,
        color: memoDarkTextColor,
      ),
      subtitle1: base.subtitle1.copyWith(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w700,
        color: memoDarkTextColor,
      ),
      subtitle2: base.subtitle2.copyWith(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w700,
        color: memoDarkTextColor,
      ),
      button: base.subtitle2.copyWith(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      caption: base.caption.copyWith(
        fontFamily: fontFamily,
        color: memoLightTextColor,
      ),
      overline: base.overline.copyWith(
        fontFamily: fontFamily,
        color: memoLightTextColor,
      ),
    );
  }

  final ThemeData base = ThemeData.light();

  return base.copyWith(
    textTheme: _basicTextTheme(base.textTheme),
    primaryColor: primaryColor,
    hintColor: Colors.black.withAlpha(95),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.black.withOpacity(0),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.black.withOpacity(0),
    ),
    scaffoldBackgroundColor: memoBackgroundColor,
    accentColor: accentColor,
  );
}
