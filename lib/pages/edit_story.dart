import 'dart:async';
import 'dart:math';

import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:memogatari/services/story.dart';
import 'package:memogatari/utils/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class EditStory extends StatefulWidget {
  @override
  _EditStoryState createState() => _EditStoryState();
}

class _EditStoryState extends State<EditStory> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    Story story = data['story'];
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0,),
      backgroundColor: memoBrown,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: 'image${data['position']}',
              child: Parent(
                style: ParentStyle()
                  ..alignment.center()
                  ..height(230)
                  ..width(170)
                  ..elevation(30)
                  ..borderRadius(all: 5)
                  ..background.image(url: story.image, fit: BoxFit.cover),
                child: Container(),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'TITLE',
              style: textTheme.overline,
            ),
            SizedBox(height: 5),
            Hero(
              tag: 'title${data['position']}',
              child: Text(
                story.title,
                style: textTheme.headline3,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'DESCRIPTION',
              style: textTheme.overline,
            ),
            SizedBox(height: 5),
            Hero(
              tag: 'info${data['position']}',
              child: Text(
                story.description,
                style: textTheme.subtitle1,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
