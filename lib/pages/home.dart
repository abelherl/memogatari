import 'dart:math';

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
//    Story(id: '1', title: 'One', description: 'Blabla', image: 'https://lh3.googleusercontent.com/ATCCeRwf9pXvoNXsLWldaQmy8A0-nkrfZVmcCiRVyxBZ__kpWoR8v9PHuWrD_nVCNo1fxXr39jdwpxfOhxGPNfLWlRTQU93fSV5eHxbNx_GNhTvuylkPO4DV6Uqn1C97xC2ULXlkESWPr8HUcv_kIEICdgpSZseX27nRZKNr_bdlpOmQlaW1I0usYiesS6ONwJJJpNmDZ7sqPZ-LuaNPYaJ1kGZ4TvPK0opVPMAl37Yo1qJXK9RNGmAIVe88IcOQutFRMfvCz7Jy5zL4DOwebZuPwqN1scx7Mre6nTD5VyHES7zEay4fQOkxn-RzVj-yuRefuicmEGw9NN6bsvquKVC-fsmV0J41x-oZIrWPwwGNp8ayj6U4qYQO3lzf5JfAOc7A7A0GTQRfFX1xBt2zczFnKph6xd6tATe1HFZHliqIyrJyW84c5gxSyzm9Jeg79rxHN_-ez5L44B469cf_0Dh1JSQ12fznYCriJvSz_Rkuo9odwnSTy3TeM_RtGDI3n97HFvVX73n_zQuUdzw59hQ88NrS6Rm7Dn3VavImq0XzKSE5g6-doaNtrRdqG6S-yt-FrbgkMzPxy_uTduwSraWe4FR3nxvsw-6nCCVBgS12jit_lE1iA0Cuy5z-NJvi3XwWY5XNBgYdcfYiaNkmxvH40kBBnIlnDdUGannfuaLw2GCcXC94EuAmUz8_DA=w1158-h651-no?authuser=1.jpg'),
//    Story(id: '2', title: 'Such Graceful, Such Wow', description: 'Blabla', image: 'https://lh3.googleusercontent.com/g1nO7EbaH5O2YMbQwaXSG5PrqGuseYRuJFSFEj8iCV5EXcdT1QrL9ruGu_RMjLiRMl54v983Y-DSIRMEsiW2q3oHLcIYiwWqSko6GFOQCXnpGlV_DDOUir7Jg8BsFCeF3kSxtxq9033FUIIcT6EDDa25TEJuIiSewpNyCi3TfpLHg-Vja7w_yczCUA1tu4A70_jO7X4PsW9YLKlUkjrhrok5bTJFxwf_ew5rp2x9pG-Qn0vIVFo2G7uxRoBS7ilKrZpCDOvcjparcRxMB5vwI1bYHGpAitjOmI7Y-AZ63G3ag_d0jVGTYqDlro0Ajm2WIRdw09ljlCkzhW1mOj2OlN3sJGjPEnWhpseJhmbsvVKurk_tjCUw57wVk3p2tGsLoH0V49QkOo4fVjvV96zUPj44uvLRFFV6uFlpJi6TS8Hygdf0FYRaJkPM9f5H79-5gpfz8N02WEaxJ8867BB2XY5QXVMDTauCcDhmF3tmFww2cT45l1YHZ6Yoao4Dv_4xmw19fuK507foHk71UlYpLeFEFkgK-MVnocvDQCCntCe2mBhP2AdbfXYdqaKgttqwdwlD2mb_PSFUbxTMAAUHxNbySHWfIqy4sZB6aCJEGH0sJWhUBgn-eT9fSMHJceevIJUPcZ647hfAR2tW1Zivksjo5buyc4cVwY3VP1NFGSQBNadpr7ti7wjNVymGJQ=w367-h651-no?authuser=1.jpg'),
//    Story(id: '3', title: 'Shut Up Already', description: 'Shut Up Already', image: 'https://lh3.googleusercontent.com/gzijFHGkTnUb-ouPiLFlHkWWQxWHhpFp9H87IaR06CkKCRCeT3M3Nd6iPt6U3q7aeKjE5tguYXcxTWwyX8Kvytpbtas7UPNpbWVOYpqH2TDv_8iAqxJ4ltb86L99xrf0BUyfJdGkbjmtoOpe-EHv4IHy583v305djlGBhhDKzGW0d5E-VWd-kEqb7deuRcHle7cCMquOjt5nDXT_NhU-HAF_Zl_SpbdjurBxdu2g3kM0j5MNw7LOvuhsmtui4QYbvHyYLuLMMYL0GHDhguIAVcTzPnilt7GRTK-GM_nHJC70XJEzz9j0LazLm2UfrBswyC5bQjZ6fHyIgJG3R5Icc25Xqh1_CYa-Jc6i431xYzka8e_0w0irN2SjahlWaFv8-NIJCqbCdIn3aPCgW3r685pd_RAV9kjw6rRpBRNWt9AIjdc2QGNRImZbo--VTTRy6EdkGo1og2mmBGuwfwsAxYDiCOgrvcli8bvUdMSwIxFC9W7QbP4Gm_DWphgwrxSVhmWStxYX4aEKhqmmGvHz3yI9cnusMygIsSuJb9Dp8zsPwZo99VghNUOLWdWJkSeOFthBPmou0oeVvNaUV8ZOITesLB2tFZx03U5eT8JqeX67yWJBMPtEMwJlHIQjQ4qcZqchNuPtRxUL1G4imojGXpokgtULM4U_xCLNCXcrStHy7BVVAzfbBTMpxG57ZQ=w367-h651-no?authuser=1.jpg'),
    Story(id: '1', title: 'A Deluxe Burger', description: "'Cause I'm still craving for them", image: 'https://images.pexels.com/photos/1639565/pexels-photo-1639565.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
    Story(id: '2', title: 'Concrete Jungle Wet Dream Tomato', description: "There's nothing you can't do when you're in New York", image: 'https://images.pexels.com/photos/2422588/pexels-photo-2422588.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
    Story(id: '3', title: 'Aina', description: 'Uh-oh wrong dimension lmao', image: 'https://images.pexels.com/photos/2340166/pexels-photo-2340166.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260'),
  ];
  PageController pageController = PageController();
  double fraction = 0.8;
  double pageOffset = 0;

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
        child: Column(
          children: <Widget>[
            SizedBox(height: 15),
            Text(
              'Memogatari',
              style: Theme.of(context).textTheme.headline4,
            ),
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
                      subtitleStyle: Theme.of(context).textTheme.subtitle1
                  );
                },
                controller: pageController,
                itemCount: listStory.length,
//                )
//              ],
          ),
            ),
        ]),
      ),
    );
  }
}

class BookCard extends StatefulWidget {
  const BookCard({
    Key key,
    @required this.angle,
    @required this.scale,
    @required this.story,
    @required this.titleStyle,
    @required this.subtitleStyle
  }) : super(key: key);

  final double angle;
  final double scale;
  final Story story;
  final TextStyle titleStyle;
  final TextStyle subtitleStyle;

  @override
  _BookCardState createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  bool pressed = false;
  double borderRadius = 13;

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    var size = MediaQuery.of(context).size;

    return Transform(
    transform: Matrix4.identity()
    ..setEntry(3,2,0.001)
    ..rotateY(widget.angle),
    alignment: Alignment.center,
      child: AspectRatio(
        aspectRatio: 3/2,
        child: Parent(gesture: Gestures()
          ..isTap((isTapped) => setState(() => pressed = isTapped)),
          style: ParentStyle()
            ..margin(
              left: 15,
              top: 90 - widget.scale * 25,
              right: 15,
              bottom: 90 - widget.scale * 25
            )
            ..maxWidth(isPortrait ? double.infinity : size.height/2)
            ..maxHeight(isPortrait ? double.infinity : size.height)
            ..ripple(true, splashColor: memoRed)
            ..elevation(pressed ? 0 : 50)
            ..scale(pressed ? 0.95 : 1)
            ..borderRadius(all: borderRadius)
            ..background.image(url: widget.story.image, fit: BoxFit.cover)
            ..animate(400, Curves.easeOutQuart),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: Stack(
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          end: Alignment.topCenter,
                          begin: Alignment.bottomCenter,
                          colors: [pressed ? memoRed.withAlpha(150) : Colors.blueGrey[900].withAlpha(150), pressed ? memoOrange.withAlpha(150) : Colors.transparent]
                      )
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      width: size.width - 130,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.story.title,
                            style: widget.titleStyle,
                            maxLines: 4,
                            overflow: TextOverflow.fade
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