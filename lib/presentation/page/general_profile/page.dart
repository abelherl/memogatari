import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:memogatari/presentation/core/app.dart';
import 'package:memogatari/shared/constant_styling.dart';

import '../../route_config.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 30, 30, 30),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SafeArea(child: Container()),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () => App.main.router.pop(),
                    color: memoRed,
                  ),
                  Expanded(child: Container()),
                  Text(
                    'Profile',
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                      color: Colors.black.withAlpha(180),
                    ),
                  ),
                  Expanded(child: Container()),
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () => App.main.router.pop(),
                    color: memoRed,
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Container(
              child: Hero(
                tag: "profile",
                child: Parent(
                  style: ParentStyle()
                    ..width(80)
                    ..height(80)
                    ..borderRadius(all: 40)
                    // ..background.color(Colors.grey.withAlpha(100)),
                    ..linearGradient(
                      colors: [memoRed, memoOrange],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Text(
              '@abelherl',
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 3),
            Text(
              'Abel Herlambang',
              style: Theme.of(context).textTheme.headline5.copyWith(
                color: Colors.black54.withAlpha(180),
              ),
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.only(left: 20, bottom: 10,),
              width: double.infinity,
              child: Text(
                "PREFERENCES",
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                  fontSize: 12,
                  color: Colors.black54,
                  letterSpacing: 1.5,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SettingsItem(heading: 'Theme', subtitle: "Customize Memoga's appearance", routeName: RouteName.generalLogin,),
            SettingsItem(heading: 'Lite Mode', subtitle: 'Optimize app performance', routeName: RouteName.generalLogin,),
            SettingsItem(heading: 'Premium Version', subtitle: 'Buy or try Premium version', routeName: RouteName.generalLogin,),
            SizedBox(height: 25),
            Container(
              padding: EdgeInsets.only(left: 20, bottom: 10,),
              width: double.infinity,
              child: Text(
                "OTHER",
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                  fontSize: 12,
                  color: Colors.black54,
                  letterSpacing: 1.5,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SettingsItem(heading: 'User Surveys', subtitle: 'Surveys with rewards from developer', routeName: RouteName.generalLogin,),
          ],
        ),
      ),
    );
  }
}

class SettingsItem extends StatefulWidget {
  const SettingsItem(
      {Key key,
        @required this.heading,
        @required this.subtitle,
        @required this.routeName,})
      : super(key: key);

  final String heading;
  final String subtitle;
  final String routeName;

  @override
  _SettingsItemState createState() => _SettingsItemState();
}

class _SettingsItemState extends State<SettingsItem> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Parent(
      gesture: Gestures()
        ..isTap((isTapped) {
          setState(() => pressed = isTapped);
        }),
      style: ParentStyle()
        ..width(double.infinity)
        ..padding(all: 15)
        ..margin(horizontal: 15, bottom: 10,)
        ..background.color(Color.fromARGB(255, 230, 230, 230))
        ..ripple(true, splashColor: memoRed.withAlpha(180), highlightColor: Colors.transparent,)
        ..borderRadius(all: 15)
        ..scale(pressed ? 0.95 : 1)
        ..animate(350, Curves.easeInOutQuart),
        // ..boxShadow(
        //   color: Colors.black12,
        //   offset: Offset(0, -1),
        //   blur: 10,
        //   spread: 1,
        // ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.heading,
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.black54.withAlpha(180),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  widget.subtitle,
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                    color: Colors.black54,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.black54.withAlpha(180),
          ),
        ],
      ),
    );
  }
}
