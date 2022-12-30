import 'package:flutter/material.dart';
import 'package:application_ecommerce/models/models.dart';
import 'package:application_ecommerce/Screen/Screen.dart';
import '../Screen/Screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('Route: ${settings.name}');
    switch (settings.name) {
      case HomePage.routeName:
        return HomePage.route();
      case DatoCartClienteScreen.routeName:
        return DatoCartClienteScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(title: Text('Error')),
            ),
        settings: RouteSettings(name: '/erro'));
  }
}
