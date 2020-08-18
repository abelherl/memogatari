

import 'dart:async';

import 'package:division/division.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memogatari/services/story.dart';
import 'package:memogatari/utils/colors.dart';

class BookCard extends StatefulWidget {
  const BookCard({
    Key key,
    @required this.angle,
    @required this.scale,
    @required this.story,
    @required this.titleStyle,
    @required this.subtitleStyle,
    @required this.offset,
    @required this.position
  }) : super(key: key);

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
  double borderRadius = 13;

  Timer timer;

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    var size = MediaQuery.of(context).size;
    var counter = 0;
    print(widget.offset);

    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3,2,0.001)
        ..rotateY(widget.angle),
      alignment: Alignment.center,
      child: AspectRatio(
        aspectRatio: 3/2,
        child: Parent(
          gesture: Gestures()
            ..isTap((isTapped) => setState(() => pressed = isTapped)),
          style: ParentStyle()
            ..margin(
                left: 15,
                top: 200 - widget.scale * 60,
                right: 15,
                bottom: 210 - widget.scale * 60
            )
            ..ripple(true, splashColor: memoRed)
            ..elevation(pressed ? 0 : 30)
            ..scale(pressed ? 0.95 : 1)
            ..borderRadius(all: borderRadius)
            ..background.color(memoOrange)
            ..background.image(url: widget.story.image, fit: BoxFit.cover)
            ..animate(450, Curves.bounceOut),
          child: GestureDetector(
            onTapDown: (_) => {
              timer = Timer(Duration(milliseconds: 1200), () {
                Navigator.pushNamed(context, '/edit_story', arguments: {
                  'story': widget.story,
                  'position': widget.position
                });
              })
            },
            onTapUp: (_){
              timer.cancel();
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: Stack(
                  children: <Widget>[
                    Parent(
                      style: ParentStyle()
                        ..height(double.infinity)
                        ..height(double.infinity)
                        ..borderRadius(all: 13)
                        ..linearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [memoRed.withAlpha(180), pressed ? memoOrange.withAlpha(150) : Colors.transparent])
                        ..background.blur(pressed ? 3 : 0),
//                    ..background.blur(widget.offset < -0.5 || widget.offset > 0.5 ? (widget.offset + 1) * 10 : widget.offset * 10)
                      child: Container(),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          width: size.width*0.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Hero(
                                tag: 'title${widget.position}',
                                child: Text(
                                    widget.story.title,
                                    style: widget.titleStyle,
                                    maxLines: 4,
                                    overflow: TextOverflow.fade,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(widget.story.description,
                                style: widget.subtitleStyle,
                                maxLines: 2,
                                overflow: TextOverflow.fade,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

//class StoryCard extends StatelessWidget {
//  const StoryCard({
//    Key key,
//  }) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return Stack(
//      children: <Widget>[
//        Positioned(
//          bottom: 0,
//          left: 0,
//          right: 0,
//          child: Parent(
//              child: SizedBox(height: 170),
//              style: ParentStyle()
//                ..background.color(Colors.white)
//                ..borderRadius(all: 15)
//                ..ripple(true)
//                ..elevation(50)
//                ..padding(all: 15)
//          ),
//        ),
//        Row(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            Flexible(
//              flex: 1,
//              child: Parent(
//                child: Container(
//                  decoration: BoxDecoration(
//                      boxShadow: [
//                        BoxShadow(
//                          color: Colors.grey.withOpacity(0.5),
//                          spreadRadius: 5,
//                          blurRadius: 7,
//                          offset: Offset(0, 3),
//                        ),
//                      ]
//                  ),
//                  child: ClipRRect(
//                    borderRadius: BorderRadius.circular(5),
//                    child: Image(
//                        width: 120,
//                        height: 140,
//                        fit: BoxFit.fill,
//                        image: NetworkImage('https://lh3.googleusercontent.com/4jFurlsRiu2o6sfGAWMtmoZSKfkmJL-AOV7mkWZY--H03Vu07jBBP_iBimqkEKkqEguIgJYeIuVrzorBJ5f028W6K7RneWbXcNWJ-GcwBaeQVjrVoLLW4sDCZo-ftOAPL_eV8-1ihLesTpA_0xSflowu2T150rCJf0kk38d9sNwjjx87ST0zG3l_EafNMLgvozJI9ZywzzNiNdT50gLhnCeM8MhfPczFKSSYnuJqXeKuUJTX0g29yj1MdbuMFrXgu2zS27Rl6-iFyIzGzIp_NHGSYZDiCq6kNyT4wHBV-cr5wAVkHSRVkcoSu4wjQkBGOxeKbPDjkIwSmhlFd5Gn60FDlxuAl6-zELP0HCDFUHaxKlMOwZcrMsV8pHEEMa_dX6cPlf8H9qKkrkGcAzLSDdHs6xIjhh13MnxC5wa3k0YBsUMFUUiasmUdn-WKNMrPUMajsyHJh9tAsKRRJSHg5BGMn9CDG-8cnCbBa5YQP2KE3njh0JPRzbeY8UvPRemCrw6jFcD0WiSE8Ssupk9XJSNxnogrArzdgu80F8FsGOzdMgH0IJ2VB60Vgr5tl00m8kOmA_OIbgqUcYs0bO_nuM48C2viu52RjBAwe7U5svz-ReaEdj_M87hT6Uq3KwUHu7lCCUIXA4rxtAEyRUk4saWmYboule8NEdH_sHetl7VDGqQx5UndmGa2KUCHBQs=w480-h734-no?authuser=0')
//                    ),
//                  ),
//                ),
//                style: ParentStyle()
//                  ..padding(all: 15),
//              ),
//            ),
//            Flexible(
//              flex: 1,
//              child: Padding(
//                padding: const EdgeInsets.fromLTRB(0,60,15,40),
//                child: Text(
//                  "This is The Story Title, Obviously",
//                  style: Theme.of(context).textTheme.headline4,
//                  maxLines: 4 ,
//                  overflow: TextOverflow.fade,
//
//                ),
//              ),
//            ),
//          ],
//        )
//      ],
//    );
//  }
//}

