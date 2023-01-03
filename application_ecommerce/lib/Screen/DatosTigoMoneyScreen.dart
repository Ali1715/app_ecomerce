import 'package:application_ecommerce/models/carritomodel.dart';
import 'package:application_ecommerce/repository/ClienteRepository.dart';
import 'package:application_ecommerce/services/pago_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:application_ecommerce/models/models.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:provider/provider.dart';
import 'package:application_ecommerce/services/services.dart';
import 'package:application_ecommerce/widgets/widgets.dart';
import 'package:vxstate/vxstate.dart';
import 'package:application_ecommerce/controller/Controller.dart';
import 'dart:async';
import 'dart:convert';
import 'package:application_ecommerce/models/usermodel.dart';
import 'package:application_ecommerce/services/services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/******************CartPage*********************************************** */

class PagoDatosScreen extends StatefulWidget {
  static const String routeName = '/DatosTigoMoneyScreen';
  static Route route() {
    return MaterialPageRoute(
        builder: (context) => PagoDatosScreen(),
        settings: RouteSettings(name: routeName));
  }

  // const DatosTigoMoneyScreen({super.key});

  const PagoDatosScreen({super.key});

  @override
  State<PagoDatosScreen> createState() {
    return _PagoDatos();
  }
}

class _PagoDatos extends State<PagoDatosScreen> {
  final TextEditingController _controlleridTrans = TextEditingController();
  final TextEditingController _controllerctaOrd = TextEditingController();
  final TextEditingController _controllerid_tipopago = TextEditingController();
  final TextEditingController _controllercostoEnv = TextEditingController();
  final TextEditingController _controllermonto = TextEditingController();
  Future<PagoDatos>? _futurePagoDatos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.canvasColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: "¡Rellena los datos!".text.bold.size(20).make(),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child:
              (_futurePagoDatos == null) ? buildColumn() : buildFutureBuilder(),
        ));
  }

  Column buildColumn() {
    //  final String userid = getUserId().toString();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _controlleridTrans,
          decoration: const InputDecoration(hintText: 'ID de Transaccion'),
        ),
        TextField(
          controller: _controllerctaOrd,
          decoration: const InputDecoration(hintText: 'Cuenta Ordenada'),
        ),
        TextField(
          controller: _controllerid_tipopago,
          decoration: const InputDecoration(hintText: 'Tipo de Pago'),
        ),
        TextField(
          controller: _controllercostoEnv,
          decoration: const InputDecoration(hintText: 'Costo de Envio'),
        ),
        TextField(
          controller: _controllermonto,
          decoration: const InputDecoration(hintText: 'Monto'),
        ),
        //  Text('7'),
        //Text('0'),
        // Text('0'),
        ElevatedButton(
          onPressed: () {
            /*  setState(() {
              _futurePagoDatos = createPagoAlbum(
                  _controlleridTrans.text,
                  _controllerctaOrd.text,
                  _controllerid_tipopago.text,
                  _controllercostoEnv.text,
                  _controllermonto.text);
            }
            
            );*/
          },
          child: const Text('Create Data'),
        ),
      ],
    );
  }

  FutureBuilder<PagoDatos> buildFutureBuilder() {
    return FutureBuilder<PagoDatos>(
      future: _futurePagoDatos,
      builder: (context, Texto) {
        if (Texto.hasData) {
          return Column(children: [
            Text(Texto.requireData.idTrans),
            Text(Texto.requireData.ctaOrd),
            Text(Texto.requireData.id_tipoPago),
            Text(Texto.requireData.costoEnv),
            Text(Texto.requireData.monto),
          ]);
        } else if (Texto.hasError) {
          return Text('${Texto.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
