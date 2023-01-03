import 'dart:async';
import 'dart:convert';
import 'package:application_ecommerce/models/usermodel.dart';
import 'package:application_ecommerce/services/services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<PagoAlbum> createPagoAlbum(String? ctaOrd, String? idTrans,
    String? monto, String? costoEnv, String? id_tipoPago) async {
  final response = await http.post(
    Uri.parse('http://192.168.0.11:8000/api/pago'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String?>{
      'ctaOrd': ctaOrd,
      'idTrans': idTrans,
      'monto': monto,
      'costoEnv': costoEnv,
      'id_tipoPago': id_tipoPago,
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return PagoAlbum.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album pago.');
  }
}

class PagoAlbum {
  final int? id;
  final String ctaOrd;
  final String monto;
  final String costoEnv;
  final String idTrans;
  final String id_tipoPago;

  const PagoAlbum(
      {this.id,
      required this.ctaOrd,
      required this.monto,
      required this.costoEnv,
      required this.idTrans,
      required this.id_tipoPago});

  factory PagoAlbum.fromJson(Map<String, dynamic> json) {
    return PagoAlbum(
      id: json["id"],
      ctaOrd: json["ctaOrd"],
      monto: json["monto"],
      costoEnv: json["costoEnv"],
      idTrans: json["idTrans"],
      id_tipoPago: json["id_tipoPago"],
    );
  }
}

class PagoAlbumPage extends StatefulWidget {
  static const String routeName = '/PagoAlbumPage';
  static Route route() {
    return MaterialPageRoute(
        builder: (context) => PagoAlbumPage(),
        settings: RouteSettings(name: routeName));
  }

  const PagoAlbumPage({super.key});

  @override
  State<PagoAlbumPage> createState() {
    return _PagoAlbumPage();
  }
}

class _PagoAlbumPage extends State<PagoAlbumPage> {
  final TextEditingController _controlleridTrans = TextEditingController();
  final TextEditingController _controllerctaOrd = TextEditingController();
  final TextEditingController _controllermonto = TextEditingController();
  final TextEditingController _controllercostoEnv = TextEditingController();
  final TextEditingController _controllerid_tipoPago = TextEditingController();
  Future<PagoAlbum>? _futurePagoAlbum;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Create Data Example'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child:
              (_futurePagoAlbum == null) ? buildColumn() : buildFutureBuilder(),
        ),
      ),
    );
  }

  Column buildColumn() {
    final String userid = getUserId().toString();
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
          controller: _controllermonto,
          decoration: const InputDecoration(hintText: 'Monto'),
        ),
        TextField(
          controller: _controllercostoEnv,
          decoration: const InputDecoration(hintText: 'Costo de Envio'),
        ),
        TextField(
          controller: _controllerid_tipoPago,
          decoration: const InputDecoration(hintText: 'Tigo Money'),
        ),
        //Text('7'),
        //Text('0'),
        //Text('0'),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futurePagoAlbum = createPagoAlbum(
                  _controlleridTrans.text,
                  _controllerctaOrd.text,
                  _controllermonto.text,
                  _controllercostoEnv.text,
                  _controllerid_tipoPago.text);
            });
            Navigator.pushNamed(context, '/UltimoPaso');
          },
          child: const Text('Create Data'),
        ),
      ],
    );
  }

  FutureBuilder<PagoAlbum> buildFutureBuilder() {
    return FutureBuilder<PagoAlbum>(
      future: _futurePagoAlbum,
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
