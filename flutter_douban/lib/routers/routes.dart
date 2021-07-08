import 'package:fluro/fluro.dart';

import 'package:flutter_douban/routers/route_handlers.dart';

class Routes {
  static String root = '/';
  static String home = '/home';
  static String login = '/login';
  static String detail = '/detail/:movieId/:movieTitle';
  static String list = '/list';

  static void configureRoutes(FluroRouter router) {
    router.define(root, handler: rootHandler);
    router.define(home, handler: homeHandler);
    router.define(login, handler: loginHandler);
    router.define(detail, handler: detailHandler);
    router.define(list, handler: listHandler);
  }
}
