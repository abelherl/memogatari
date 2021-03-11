import 'package:flutter/material.dart';
import 'package:memogatari/presentation/core/app.dart';
import 'package:memogatari/presentation/route_config.dart';
import 'package:memogatari/shared/constant_styling.dart';
import 'package:sailor/sailor.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      App.main.router.navigate(
        RouteName.generalLogin,
        navigationType: NavigationType.pushReplace,
        transitions: [SailorTransition.fade_in],
        transitionDuration: Duration(milliseconds: 600),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Text(
            'Memogatari',
            style: Theme.of(context).textTheme.headline6.copyWith(
              color: memoRed,
            ),
          ),
        ),
      ),
    );
  }
}
