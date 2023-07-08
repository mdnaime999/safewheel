import 'package:get/get.dart';

import '../modules/config.dart';
import '../views/pages/dedails/details.page.dart';
import '../views/pages/home/home.page.dart';
import 'bindings.dart';

class RouteManager {
  static String home = "/";
  static String delails = "/delails";

  static List<GetPage> routes = [
    GetPage(
      name: home,
      page: () => HomePage(),
      bindings: [
        HomeBindings(),
        DetailsBindings()
      ],
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500),
      // middlewares: [AuthGuard()],
    ),
    GetPage(
      name: delails,
      page: () => DetailsPage(),
      bindings: [
        DetailsBindings()
      ],
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500),
      // middlewares: [AuthGuard()],
    ),
  ];

  void jointRoute() {
    for (List<GetPage<dynamic>> module in modules) {
      for (GetPage route in module) {
        routes.add(route);
      }
    }
  }
}
