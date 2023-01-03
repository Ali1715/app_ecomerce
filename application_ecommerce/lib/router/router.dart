import 'package:application_ecommerce/Screen/DatosTigoMoneyScreen.dart';
import 'package:application_ecommerce/Screen/MetodoPagoCardScreen.dart';
import 'package:application_ecommerce/Screen/MetodoPagoTigoScreen.dart';
import 'package:application_ecommerce/Screen/TipoPagoScreen.dart';
import 'package:application_ecommerce/Screen/UltimoPaso.dart';
import 'package:flutter/material.dart';
import 'package:application_ecommerce/models/models.dart';
import 'package:application_ecommerce/Screen/Screen.dart';
import '../Screen/Screen.dart';
import 'package:application_ecommerce/services/services.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('Route: ${settings.name}');
    switch (settings.name) {
      case HomePage.routeName:
        return HomePage.route();
      case DatoCartClienteScreen.routeName:
        return DatoCartClienteScreen.route();
      case PagoScreen.routeName:
        return PagoScreen.route();
      case MetodoPagoTigoScreen.routeName:
        return MetodoPagoTigoScreen.route();
      case MetodoPagoCardScreen.routeName:
        return MetodoPagoCardScreen.route();
      case UltimoPaso.routeName:
        return UltimoPaso.route();
      // case PagoDatosScreen.routeName:
      // return PagoDatosScreen.route();
      case PagoAlbumPage.routeName:
        return PagoAlbumPage.route();
      case PDF_factura.routeName:
        return PDF_factura.route();
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
