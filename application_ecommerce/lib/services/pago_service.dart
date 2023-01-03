//import 'package:application_ecommerce/models/api_response.dart';
import 'package:application_ecommerce/models/tipoPagomodel.dart';
import 'package:flutter/material.dart';
import 'package:application_ecommerce/models/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//import 'package:mysql1/mysql1.dart';

class pagoService extends ChangeNotifier {
  //var db_p = new Mysql();
  //var name = '';

  final String _baseUrl = 'http://192.168.0.11:8000/api/pago';

  final List<Pago> pago = [];
  var pagosresp = <Pago>[];
  late Pago selectedpago;
  final List<Pago> listselectpago = [];
  bool isLoading = true;

  pagoService() {
    this.Loadpago();
  }

  /***************************Metodo Get listar***************************************/
  Future<List<Pago>> Loadpago() async {
    this.isLoading = true;
    notifyListeners();
    final url = Uri.parse(_baseUrl);
    final resp = await http.get(url);

    final List<dynamic> pagoMap = json.decode(resp.body);
    //print(productoMap);
    //for (var items in productoMap) {
    pagoMap.forEach((value) {
      final tempPro = Pago.fromMap(value);
      tempPro.id = 1;
      this.pago.add(tempPro);
    });

    this.isLoading = false;
    notifyListeners();
    // print(tipopago);
    return this.pago;
  }
}

/*******************************Metodo Post Store******************************************************* */
/*Future<PagoDatos> createPagoDatos(String? ctaOrd, String? monto,
    String? costoEnv, String? idTrans, String? id_tipoPago) async {
  final response = await http.post(
    Uri.parse('http://192.168.0.11:8000/api/pago'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String?>{
      'ctaOrd': ctaOrd,
      'monto': monto,
      'costoEnv': costoEnv,
      'idTrans': idTrans,
      'id_tipoPago': id_tipoPago,
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return PagoDatos.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create pago datos.');
  }
}
*/