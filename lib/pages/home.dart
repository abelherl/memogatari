import 'package:clay_containers/clay_containers.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:memogatari/utils/colors.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    end: Alignment.topRight,
                    begin: Alignment.bottomLeft,
                    colors: [memoRed, memoRed]
                )
            ),
        ),
        title: Text(
          'Memogatari',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ClampingScrollPhysics(),
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 15,),
              Opacity(
                opacity: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Your Story',
                        style: Theme.of(context).textTheme.headline6,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ),
              GridView.count(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 50),
                physics: ScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Parent(
                          child: SizedBox(height: 200),
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
                                    image: AssetImage('assets/book.jpg')
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
                                "I'm Thinking of Ending Things of Ending Things",
                                style: Theme.of(context).textTheme.headline4,
                                maxLines: 4 ,
                                overflow: TextOverflow.fade,

                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Parent(
                    child: Container(
                      child: Text(
                        'Astray Medico',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                    style: ParentStyle()
                      ..background.color(Colors.white)
                      ..borderRadius(all: 15)
                      ..ripple(true)
                      ..elevation(40)
                      ..padding(all: 15)
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
