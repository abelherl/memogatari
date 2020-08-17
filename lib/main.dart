import 'package:flutter/material.dart';
import 'package:memogatari/pages/edit_story.dart';
import 'package:memogatari/pages/home.dart';
import 'package:memogatari/pages/splash.dart';
import 'package:memogatari/utils/theme.dart';
import 'utils/colors.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  theme: mainTheme(),
  routes: {
    '/': (context) => Splash(),
    '/home': (context) => Home(),
    '/edit_story': (context) => EditStory()
  },
));