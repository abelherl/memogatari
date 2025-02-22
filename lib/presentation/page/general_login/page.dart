import 'dart:async';
import 'dart:math';

import 'package:memogatari/shared/constant_styling.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:memogatari/domain/entity/user.dart';
import 'package:memogatari/presentation/core/app.dart';
import 'package:memogatari/presentation/route_config.dart';
import 'package:memogatari/shared/constant_styling.dart';
import 'package:sailor/sailor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double _top;
  double _height;
  double _opacity = 0;
  bool _animateSplash = false;
  bool _allowAnimate = true;

  var listStory = [
    Story(
        id: '1',
        title: 'A Deluxe Burger',
        description: "'Cause I'm still craving for them smh",
        image:
            'https://images.pexels.com/photos/1639565/pexels-photo-1639565.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
    Story(
        id: '2',
        title: 'Concrete Jungle K Dream Tomato',
        description: "There's nothing you can't do when you're in New York",
        image:
            'https://images.pexels.com/photos/2422588/pexels-photo-2422588.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
    Story(
        id: '3',
        title: 'Aina',
        description: 'Uh-oh wrong dimension lmao',
        image:
            'https://images.pexels.com/photos/2340166/pexels-photo-2340166.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260'),
    Story(
        id: '4',
        title: 'Astray Medico',
        description: 'Poor Norina aww',
        image:
            'https://i.pinimg.com/originals/b6/02/a5/b602a56b18086d83ad36ac32e8a0e3ed.jpg'),
    Story(
        id: '5',
        title: 'My Best Friend Acts A Little Bit Different',
        description: 'Long ass title lol',
        image: 'https://c.stocksy.com/a/q9u600/z9/1645842.jpg'),
  ];
  PageController pageController = PageController();
  double fraction = 0.75;
  double pageOffset = 0;
  int _currentPage = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: fraction)
      ..addListener(() {
        setState(() {
          pageOffset = pageController.page;
          print(pageOffset);
        });
      });

    Future.delayed(Duration(milliseconds: 1), () {
      _opacity = 1;
      _top = MediaQuery.of(context).size.height / 2;

      setState(() {});
    });

    Future.delayed(Duration(milliseconds: 3000), () {
      _height = 0;

      setState(() {});
    });

    Future.delayed(Duration(milliseconds: 2000), () {
      _top = 30;
      _animateSplash = true;

      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Flex(
              direction: Axis.vertical,
              children: [
                Flexible(
                  flex: 2,
                  child: PageView.builder(
                    physics: BouncingScrollPhysics(),
                    onPageChanged: (page) {
                      _currentPage = page;
                    },
                    itemBuilder: (context, position) {
                      double scale = max(
                          fraction, 1 - (pageOffset - position).abs() + fraction);
                      var angle = (pageOffset - position).abs();

                      if (angle > 0.5) {
                        angle = 1 - angle;
                      }

                      return BookCard(
                        angle: angle,
                        scale: scale,
                        story: listStory[position],
                        titleStyle: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: Colors.white),
                        subtitleStyle:
                            Theme.of(context).textTheme.subtitle2.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                        offset: pageOffset - position,
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
              bottom: 0,
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Expanded(
                      child: FlatButton(
                        onPressed: () => _animatePage(false),
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Container(),
                      ),
                    ),
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
                    Expanded(
                      child: FlatButton(
                        onPressed: () => _animatePage(true),
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Container(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Parent(
              style: ParentStyle()
                ..height(_height)
                ..linearGradient(
                  colors: [
                    _animateSplash
                        ? Theme.of(context).scaffoldBackgroundColor.withAlpha(0)
                        : memoRed,
                    _animateSplash
                        ? Theme.of(context).scaffoldBackgroundColor.withAlpha(0)
                        : memoOrange,
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                )
                ..animate(
                  1500,
                  Curves.easeOutQuart,
                ),
            ),
            AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOutQuart,
                top: _top,
                child: AnimatedOpacity(
                  opacity: _opacity,
                  duration: Duration(milliseconds: 100),
                  curve: Curves.easeInOutQuart,
                  child: Txt(
                    'Memogatari',
                    style: TxtStyle()
                      ..fontSize(_animateSplash ? 20 : 24)
                      ..fontWeight(FontWeight.w300)
                      ..textColor(_animateSplash ? memoRed : Theme.of(context).scaffoldBackgroundColor)
                      ..animate(1000, Curves.easeInOutQuart),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  void _animatePage(bool next) {
    if (_allowAnimate) {
      bool loop = false;
      int page = _currentPage;

      _allowAnimate = false;

      if (next ? page == listStory.length - 1 : page == 0) {
        loop = true;
        page = next ? 0 : listStory.length - 1;
      }
      else {
        page = next ? page + 1: page - 1;
      }

      print('pressed $loop');
      pageController.animateToPage(page, duration: Duration(milliseconds: 500), curve: Curves.easeInOutQuart);

      Future.delayed(Duration(milliseconds: 500), () {
        _allowAnimate = true;
      });
    }
  }
}

class BookCard extends StatefulWidget {
  const BookCard(
      {Key key,
      @required this.angle,
      @required this.scale,
      @required this.story,
      @required this.titleStyle,
      @required this.subtitleStyle,
      @required this.offset,
      @required this.position})
      : super(key: key);

  final double angle;
  final double scale;
  final Story story;
  final TextStyle titleStyle;
  final TextStyle subtitleStyle;
  final double offset;
  final int position;

  @override
  _BookCardState createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  bool pressed = false;
  double borderRadius = 20;

  Timer timer;
  bool isTapped = true;

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    var size = MediaQuery.of(context).size;
    print(widget.offset);

    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        // ..rotateX(-widget.angle)
        ..rotateY(widget.angle*1.5),
      alignment: Alignment.center,
      child: Stack(
        children: [
          Parent(
            style: ParentStyle()
              ..margin(
                left: 10,
                top: 120,
                right: 10,
                bottom: 130,
              )
              ..elevation(pressed ? 0 : 50)
              ..scale(pressed ? 0.95 : 1)
              ..borderRadius(all: borderRadius)
              ..background.color(memoOrange)
              ..animate(350, Curves.easeInOutQuart),
            child: SpinKitFadingCube(
              color: Colors.white,
              size: 30,
            ),
          ),
          Parent(
            gesture: Gestures()
              ..isTap((isTapped) {
                // if (pressed) {
                //   Future.delayed(Duration(milliseconds: 500), (){
                //     setState(() => pressed = isTapped);
                //   });
                // }
                // else {
                  setState(() => pressed = isTapped);
                // }
              }),
            style: ParentStyle()
              ..margin(
                left: 10,
                top: 120,
                right: 10,
                bottom: 130,
              )
              ..ripple(true, splashColor: memoRed)
              ..scale(pressed ? 0.95 : 1)
              ..borderRadius(all: borderRadius)
              ..background.image(url: widget.story.image, fit: BoxFit.cover)
              ..animate(350, Curves.easeInOutQuart),
            child: GestureDetector(
              onTapDown: (_) => {
                isTapped = true,
                timer = Timer(Duration(milliseconds: 450), () {
                  isTapped = false;
//                print('false: $isTapped');
                }),

                timer = Timer(Duration(milliseconds: 1200), () {
                  Navigator.pushNamed(context, '/edit_story', arguments: {
                    'story': widget.story,
                    'position': widget.position
                  });
                }),
              },
              onTapCancel: () {
                timer.cancel();
              },
              onTapUp: (_) {
                if (isTapped) {
                  print('Just tap: $isTapped');
                }
                timer.cancel();
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius),
                child: Stack(children: <Widget>[
                  Parent(
                    style: ParentStyle()
                      ..height(double.infinity)
                      ..height(double.infinity)
                      ..borderRadius(all: 13)
                      ..linearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            pressed
                                ? memoRed.withAlpha(150)
                                : memoRed.withAlpha(0),
                            pressed
                                ? memoOrange.withAlpha(150)
                                : memoOrange.withAlpha(0)
                          ]),
                       // ..background.blur(pressed ? 3 : 0),
                   // ..background.blur(widget.offset < -0.5 || widget.offset > 0.5 ? (widget.offset + 1) * 10 : widget.offset * 10)
                    child: Container(),
                  ),
                  Positioned(
                    bottom: 15,
                    left: 15,
                    child: Parent(
                      style: ParentStyle()
                        ..width(size.width / 1.6)
                        ..padding(all: 15)
                        ..background.blur(15)
                        // ..background.color(Colors.white.withAlpha(80))
                        ..borderRadius(all: borderRadius),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Hero(
                            tag: 'title${widget.position}',
                            child: Text(
                              widget.story.title,
                              style: widget.titleStyle,
                              maxLines: 3,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            widget.story.description,
                            style: widget.subtitleStyle,
                            maxLines: 2,
                            overflow: TextOverflow.fade,
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
