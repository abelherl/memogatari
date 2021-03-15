import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memogatari/presentation/page/general_home/page.dart';
import 'package:sailor/sailor.dart';
import '../route_config.dart';

class GeneralRouteConfig {
  static final List<SailorRoute> routes = [
    SailorRoute(
      name: RouteName.generalHome,
      builder: (context, args, params) {
        return HomePage();
      },
    ),
    // SailorRoute(
    //   name: RouteName.generalLogin,
    //   builder: (context, args, params) {
    //     return LoginPage();
    //   },
    // ),
  ];
}
