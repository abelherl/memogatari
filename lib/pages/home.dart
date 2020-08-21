import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hive/hive.dart';
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
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 20,
              child: Flex(
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 7,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text(
                          'Memogatari',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: IconButton(
                      icon: Icon(Ionicons.ios_add),
                    ),
                  )
                ],
              ),
            ),
            Flex(
              direction: Axis.vertical,
              children: [
                Expanded(
                  flex: 1,
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
                          titleStyle: Theme.of(context).textTheme.headline3,
                          subtitleStyle: Theme.of(context).textTheme.subtitle1,
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
              bottom: 30,
              child: SmoothPageIndicator(
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
