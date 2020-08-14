import 'dart:math';

import 'package:clay_containers/clay_containers.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:memogatari/services/story.dart';
import 'package:memogatari/utils/colors.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var listStory = [
    Story(id: '1', title: 'One', description: 'Blabla', image: 'assets/book.jpg'),
    Story(id: '2', title: 'Two', description: 'Blabla', image: 'assets/book.jpg'),
    Story(id: '3', title: 'Three', description: 'Blabla', image: 'assets/book.jpg'),
  ];
  PageController pageController;
  double fraction = 0.8;
  double pageOffset;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0, viewportFraction: fraction)
      ..addListener(() {
        setState(() {
          pageOffset = pageController.page;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child:
//            Stack(
//              overflow: Overflow.visible,
//              children: <Widget>[
//                Parent(
//                  child: Padding(
//                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.start,
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        Text(
//                          'Your\nStories',
//                          style: Theme.of(context).textTheme.headline3,
//                          textAlign: TextAlign.left,
//                        ),
//                      ],
//                    ),
//                  ),
//                  style: ParentStyle()
//                    ..height(size.height * 0.05)
//                    ..minHeight(180)
//                    ..background.color(memoBgColor)
//                    ..borderRadius(bottomLeft: 15, bottomRight: 15),
//                ),
                PageView.builder(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, position) {
                    double scale = max(fraction, 1 - (pageOffset - position).abs() + fraction);
                    return Parent(
                      style: ParentStyle()
                        ..margin(
                          left: 15,
                          top: 100 - scale * 25,
                          right: 15,
                          bottom: 100
                        )
                        ..elevation(50)
                        ..borderRadius(all: 15)
                        ..background.color(Colors.white),
                      child: Container(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              listStory[position].title,
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            Text(
                                listStory[position].description,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  controller: pageController,
                  itemCount: listStory.length,
//                )
//              ],
          ),
        ),
      ),
    );
  }
}

class StoryCard extends StatelessWidget {
  const StoryCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Parent(
            child: SizedBox(height: 170),
            style: ParentStyle()
              ..background.color(Colors.white)
              ..borderRadius(all: 15)
              ..ripple(true)
              ..elevation(50)
              ..padding(all: 15)
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Parent(
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                      BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                    ]
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image(
                      width: 120,
                      height: 140,
                      fit: BoxFit.fill,
                      image: NetworkImage('https://lh3.googleusercontent.com/4jFurlsRiu2o6sfGAWMtmoZSKfkmJL-AOV7mkWZY--H03Vu07jBBP_iBimqkEKkqEguIgJYeIuVrzorBJ5f028W6K7RneWbXcNWJ-GcwBaeQVjrVoLLW4sDCZo-ftOAPL_eV8-1ihLesTpA_0xSflowu2T150rCJf0kk38d9sNwjjx87ST0zG3l_EafNMLgvozJI9ZywzzNiNdT50gLhnCeM8MhfPczFKSSYnuJqXeKuUJTX0g29yj1MdbuMFrXgu2zS27Rl6-iFyIzGzIp_NHGSYZDiCq6kNyT4wHBV-cr5wAVkHSRVkcoSu4wjQkBGOxeKbPDjkIwSmhlFd5Gn60FDlxuAl6-zELP0HCDFUHaxKlMOwZcrMsV8pHEEMa_dX6cPlf8H9qKkrkGcAzLSDdHs6xIjhh13MnxC5wa3k0YBsUMFUUiasmUdn-WKNMrPUMajsyHJh9tAsKRRJSHg5BGMn9CDG-8cnCbBa5YQP2KE3njh0JPRzbeY8UvPRemCrw6jFcD0WiSE8Ssupk9XJSNxnogrArzdgu80F8FsGOzdMgH0IJ2VB60Vgr5tl00m8kOmA_OIbgqUcYs0bO_nuM48C2viu52RjBAwe7U5svz-ReaEdj_M87hT6Uq3KwUHu7lCCUIXA4rxtAEyRUk4saWmYboule8NEdH_sHetl7VDGqQx5UndmGa2KUCHBQs=w480-h734-no?authuser=0')
                    ),
                  ),
                ),
                style: ParentStyle()
                  ..padding(all: 15),
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0,60,15,40),
                child: Text(
                  "This is The Story Title, Obviously",
                  style: Theme.of(context).textTheme.headline4,
                  maxLines: 4 ,
                  overflow: TextOverflow.fade,

                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
