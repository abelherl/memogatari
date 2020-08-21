import 'dart:math';

import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hive/hive.dart';
import 'package:memogatari/pages/add_story.dart';
import 'package:memogatari/services/story.dart';
import 'package:memogatari/utils/colors.dart';
import 'package:memogatari/utils/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var listStory = [
    Story(id: '1', title: 'A Deluxe Burger', description: "'Cause I'm still craving for them smh", image: 'https://images.pexels.com/photos/1639565/pexels-photo-1639565.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
    Story(id: '2', title: 'Concrete Jungle K Dream Tomato', description: "There's nothing you can't do when you're in New York", image: 'https://images.pexels.com/photos/2422588/pexels-photo-2422588.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
    Story(id: '3', title: 'Aina', description: 'Uh-oh wrong dimension lmao', image: 'https://images.pexels.com/photos/2340166/pexels-photo-2340166.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260'),
    Story(id: '4', title: 'Astray Medico', description: 'Poor Norina aww', image: 'https://i.pinimg.com/originals/b6/02/a5/b602a56b18086d83ad36ac32e8a0e3ed.jpg'),
    Story(id: '5', title: 'My Best Friend Acts A Little Bit Different', description: 'Long ass title lol', image: 'https://c.stocksy.com/a/q9u600/z9/1645842.jpg'),
  ];
  PageController pageController = PageController();
  double fraction = 0.75;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0, viewportFraction: fraction)
      ..addListener(() {
        setState(() {
          pageOffset = pageController.page;
          print(pageOffset);
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var pressed = false;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 20,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text(
                    'Memogatari',
                    style: textTheme.headline4,
                  ),
                ),
              ),
            ),
            Flex(
              direction: Axis.vertical,
              children: [
                Flexible(
                  flex: 2,
                  child: PageView.builder(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, position) {
                        double scale = max(fraction, 1 - (pageOffset - position).abs() + fraction);
                        var angle = (pageOffset - position).abs();

                        if (angle > 0.5) {
                          angle = 1 - angle;
                      }

                      return BookCard(
                          angle: angle,
                          scale: scale,
                          story: listStory[position],
                          titleStyle: textTheme.headline3,
                          subtitleStyle: textTheme.subtitle1,
                          offset: pageOffset-position,
                          position: position,
                        );
                      },
                      controller: pageController,
                      itemCount: listStory.length,
                  ),
                ),
              ],
            ),
            Positioned(
              top: 8,
              right: 15,
              child: Hero(
                tag: 'add',
                child: Parent(
                  gesture: Gestures()
                    ..onTap(() {
                      Navigator.push(context, PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 300),
                          pageBuilder: (_, __, ___) => AddStory())
                      );
                    }),
                  style: ParentStyle()
                    ..height(40)
                    ..width(40)
                    ..borderRadius(all: 25)
                    ..ripple(true)
                    ..scale(pressed ? 0.9 : 1),
                  child: Container(
                    child: Icon(Icons.add, color: memoBrown,),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              child: Row(
                children: <Widget>[
                  SmoothPageIndicator(
                    controller: pageController,
                    count: listStory.length,
                    effect: ExpandingDotsEffect(
                      dotWidth: 10,
                      dotHeight: 10,
                      radius: 6.5,
                      dotColor: memoBrown,
                      activeDotColor: memoRed,
                    ),
                  ),
                ],
              ),
            )
        ]),
      ),
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
