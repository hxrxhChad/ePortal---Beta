import 'package:flutter/material.dart';

import '../backend/models/index.dart';
import '../frontend/views/index.dart';

class Routes {
  Routes();

  static const initial = '/';
  static const adminHome = '/admin_home';
  static const addTest = '/add_test';
  static const studentHome = '/student_home';
  static const message = '/message';
  static const setting = '/setting';

  // final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // Future<dynamic> navigateTo(String routeName, {Object? arguments}) {
  //   return navigatorKey.currentState!
  //       .pushNamed(routeName, arguments: arguments);
  // }

  // void goBack() {
  //   return navigatorKey.currentState!.pop();
  // }

  // void popUntil(String routeName) {
  //   navigatorKey.currentState!.popUntil(ModalRoute.withName(routeName));
  // }

  // void replaceWith(String routeName, {Object? arguments}) {
  //   navigatorKey.currentState!
  //       .pushReplacementNamed(routeName, arguments: arguments);
  // }

  // Route<dynamic> generateRoute(RouteSettings settings) {
  //   debugPrint('generateRoute: ${settings.name}');
  //   switch (settings.name) {
  //     case initial:
  //       return _getPageRoute(AuthView());
  //     case adminHome:
  //       return _getPageRoute(AdminHome());
  //     case studentHome:
  //       return _getPageRoute(StudentHome());
  //     case addTest:
  //       return _getPageRoute(AddTestView());
  //     default:
  //       return _getPageRoute(Load(
  //         onTap: () {},
  //       )); // You may want to create a NotFoundView for handling unknown routes
  //   }
  // }

  // PageRoute _getPageRoute(Widget child) {
  //   return MaterialPageRoute(
  //     builder: (context) => child,
  //   );
  // }
  static List<PageModel> routes() {
    return [
      PageModel(route: initial, page: AuthView()),
      PageModel(route: adminHome, page: AdminHome()),
      PageModel(route: studentHome, page: StudentHome()),
      PageModel(route: addTest, page: AddTestView()),
    ];
  }

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }

    // todo modify here (error page)
    return MaterialPageRoute(
        builder: (_) => const Scaffold(), settings: settings);
  }
}
