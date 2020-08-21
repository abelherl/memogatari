import 'dart:async';
import 'dart:math';

import 'package:division/division.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:memogatari/services/story.dart';
import 'package:memogatari/utils/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AddStory extends StatefulWidget {
  @override
  _AddStoryState createState() => _AddStoryState();
}

class _AddStoryState extends State<AddStory> {
  @override
  Widget build(BuildContext context) {
    Story story = Story();
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: memoRed
        ),
      ),
      body: Hero(
        tag: 'add',
        child: Parent(
          style: ParentStyle()
            ..background.color(memoBone),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Parent(
                    gesture: Gestures()
                      ..onTap(() {
                        print('Picker');
                      }),
                    style: ParentStyle()
                      ..alignment.center()
                      ..height(230)
                      ..width(170)
                      ..elevation(30)
                      ..borderRadius(all: 5)
                      ..ripple(true, splashColor: memoOrange)
                      ..linearGradient(
                          colors: [memoRed, memoOrange],
                          begin: AlignmentDirectional.bottomCenter,
                          end: AlignmentDirectional.topCenter
                        ),
                    child: Container(
                      child: Icon(Ionicons.ios_add_circle, color: Colors.white, size: 40,),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'TITLE',
                    style: textTheme.overline,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'New Story',
                    style: textTheme.headline5,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'DESCRIPTION',
                    style: textTheme.overline,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'New Description',
                    style: textTheme.subtitle2,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
