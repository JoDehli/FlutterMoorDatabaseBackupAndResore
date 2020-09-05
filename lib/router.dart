import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'backup_page.dart';
import 'homepage.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MyHomePage());
      case '/backup':
        return MaterialPageRoute(builder: (_) => BackupScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}'))));
    }
  }
}
