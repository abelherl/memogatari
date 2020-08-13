import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:memogatari/utils/colors.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  Map data = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: memoPink,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                end: Alignment.topRight,
                begin: Alignment.bottomLeft,
                colors: [memoRed, memoOrange]
              )
            ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Memogatari',
                style: TextStyle(
                  fontFamily: 'Playfair',
                    fontWeight: FontWeight.w900,
                    color: memoWhite,
                    fontSize: 30,
                ),
              ),
              Text(
                'Keep the story going.',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  color: memoHint,
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
