import 'package:flutter/material.dart';
import 'package:memogatari/utils/colors.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  Map data = {};

  void goToHome() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  void initState() {
    super.initState();
    print('init state ran');
    goToHome();
  }

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
                style: Theme.of(context).textTheme.headline3
              ),
              Text(
                'Keep the story, going.',
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
