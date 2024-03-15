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

  static List<PageModel> routes() {
    return [
      const PageModel(route: initial, page: AuthView()),
      const PageModel(route: adminHome, page: AdminHome()),
      const PageModel(route: studentHome, page: StudentHome()),
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
