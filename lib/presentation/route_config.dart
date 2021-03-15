import 'package:memogatari/presentation/route/general_route.dart';
import 'package:sailor/sailor.dart';

/// Route name directory
class RouteName {
  // General routes
  static const String generalHome = '/';
  static const String generalLogin = '/login';
}

class RouteConfig {
  static void configureMainRoutes(Sailor router) {
    router.addRoutes(GeneralRouteConfig.routes);
  }
}
