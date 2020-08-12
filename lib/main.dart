import 'package:flutter/material.dart';
import 'package:memogatari/pages/home.dart';
import 'package:memogatari/pages/splash.dart';
import 'utils/colors.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  theme: ThemeData(
    scaffoldBackgroundColor: memoBgColor,
    textTheme: TextTheme(

    )
  ),
  routes: {
    '/': (context) => Splash(),
    '/home': (context) => Home()
  },
));