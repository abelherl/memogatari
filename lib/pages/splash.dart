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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'MEMOGATARI',
              style: TextStyle(
                fontFamily: 'Poppins',
                  fontWeight: FontWeight.w200,
                  color: memoWhite,
                  fontSize: 25,
                  letterSpacing: 8
              ),
            ),
            Text(
              'Keep the story going.',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                color: memoHint,
                fontSize: 15,
              ),
            )
          ],
        ),
      ),
    );
  }
}
