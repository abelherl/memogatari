import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memogatari/presentation/page/general_login/page.dart';
import 'package:memogatari/presentation/page/general_splash/page.dart';
import 'package:sailor/sailor.dart';
import '../route_config.dart';

class GeneralRouteConfig {
  static final List<SailorRoute> routes = [
    SailorRoute(
      name: RouteName.generalSplash,
      builder: (context, args, params) {
        return SplashPage();
      },
    ),
    SailorRoute(
      name: RouteName.generalLogin,
      builder: (context, args, params) {
        return LoginPage();
      },
    ),
  ];
}
