import 'package:application_ecommerce/models/api_response.dart';
import 'package:flutter/material.dart';
import 'package:application_ecommerce/models/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mysql1/mysql1.dart';

class productoService extends ChangeNotifier {
  //var db_p = new Mysql();
  //var name = '';

  final String _baseUrl = 'http://192.168.0.18:8000/api/productos';

  final List<Productos> productos = [];
  var productosresp = <Productos>[];
  late Productos selectedProduct;
  bool isLoading = true;

  productoService() {
    this.LoadProductos();
  }

  /*void _getProduct() {
    db_p.conexion().then((conn) {
      String sql = 'select name from laravel.productos where id=1;';
      conn.query(sql).then((results) {
        for (var row in results) {
          setState() {
            name = row[0];
            print(name);
          }
        }
      });
    });
  }*/

  /******************************************************************/
  Future<List<Productos>> LoadProductos() async {
    this.isLoading = true;
    notifyListeners();
    final url = Uri.parse(_baseUrl);
    final resp = await http.get(url);

    final List<dynamic> productoMap = json.decode(resp.body);
    //print(productoMap);
    //for (var items in productoMap) {
    productoMap.forEach((value) {
      final tempPro = Productos.fromMap(value);
      tempPro.id = 1;
      this.productos.add(tempPro);
    });

    this.isLoading = false;
    notifyListeners();
    print(productos);
    return this.productos;
  }
  /************************************************************************************** */

}
