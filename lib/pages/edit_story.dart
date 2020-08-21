import 'dart:async';
import 'dart:math';

import 'package:clay_containers/clay_containers.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: memoRed
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: 'image${data['position']}',
              child: Parent(
                gesture: Gestures()
                  ..onTap(() {
                    Navigator.pushNamed(context, '/image_viewer', arguments: {
                      'image': story.image,
                      'position': data['position']
                    });
                  }),
                style: ParentStyle()
                  ..alignment.center()
                  ..height(230)
                  ..width(170)
                  ..borderRadius(all: 5)
                  ..elevation(30)
                  ..ripple(true, splashColor: memoRed)
                  ..background.image(url: story.image, fit: BoxFit.cover),
                child: Container(),
              ),
            ),
            SizedBox(height: 30),
            Text(
              'TITLE',
              style: textTheme.overline,
            ),
            SizedBox(height: 5),
            Hero(
              tag: 'title${data['position']}',
              child: Text(
                story.title,
                style: textTheme.headline5,
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
                style: textTheme.subtitle2,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
