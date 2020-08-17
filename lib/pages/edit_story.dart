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
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(backgroundColor: memoBrown, elevation: 0,),
      backgroundColor: memoBrown,
      body: Column(
        children: <Widget>[
          Hero(
            tag: 'title1',
            child: Text(
                'Astray Medico',
                style: textTheme.headline3,
            ),
          ),
          SizedBox(height: 10),
          Text('Poor Norina aww',
            style: textTheme.subtitle1,
            overflow: TextOverflow.fade,
          ),
        ],
      ),
    );
  }
}
