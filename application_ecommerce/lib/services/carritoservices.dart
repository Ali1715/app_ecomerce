import 'dart:async';
import 'dart:convert';
import 'package:application_ecommerce/models/usermodel.dart';
import 'package:application_ecommerce/services/services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> createAlbum(
    String? idCliente, String? estado, String? total) async {
  final response = await http.post(
    Uri.parse('http://192.168.0.11:8000/api/carrito'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String?>{
      'idCliente': idCliente,
      'estado': estado,
      'total': total,
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class Album {
  final int? id;
  final String idCliente;
  final String estado;
  final String total;

  const Album(
      {this.id,
      required this.idCliente,
      required this.estado,
      required this.total});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      idCliente: json['idCliente'],
      estado: json['estado'],
      total: json['total'],
    );
  }
}

class CarritoPage extends StatefulWidget {
  const CarritoPage({super.key});

  @override
  State<CarritoPage> createState() {
    return _CarritoPage();
  }
}

class _CarritoPage extends State<CarritoPage> {
  final TextEditingController _controlleridcliente = TextEditingController();
  final TextEditingController _controllerestado = TextEditingController();
  final TextEditingController _controllertotal = TextEditingController();
  Future<Album>? _futureAlbum;

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
          child: buildColumn(),
        ),
      ),
    );
  }

  Column buildColumn() {
    final String userid = getUserId().toString();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('7'),
        Text('0'),
        Text('0'),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futureAlbum = createAlbum(_controlleridcliente.text,
                  _controllerestado.text, _controllertotal.text);
            });
          },
          child: const Text('Create Data'),
        ),
      ],
    );
  }

  FutureBuilder<Album> buildFutureBuilder() {
    return FutureBuilder<Album>(
      future: _futureAlbum,
      builder: (context, Texto) {
        if (Texto.hasData) {
          return Column(children: [
            Text('7'),
            Text('0'),
            Text('0'),
          ]);
        } else if (Texto.hasError) {
          return Text('${Texto.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
