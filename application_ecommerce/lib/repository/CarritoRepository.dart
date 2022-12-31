import 'package:application_ecommerce/repository/Repository.dart';
import 'package:application_ecommerce/models/carritomodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class CarritoRepository implements RepositoryCarrito {
  String _baseUrl = 'http://192.168.0.16:8000/api/carrito';

  final List<Carritos> CarritosList = [];
  var productosresp = <Carritos>[];
  late Carritos selectedProduct;
  bool isLoading = true;

  productoService() {
    this.getCarritos();
  }

  @override
  //getCarrito
  Future<List<Carritos>> getCarritos() async {
    final url = Uri.parse(_baseUrl);
    final resp = await http.get(url);

    final List<dynamic> productoMap = json.decode(resp.body);
    //print(productoMap);
    //for (var items in productoMap) {
    productoMap.forEach((value) {
      final tempPro = Carritos.fromMap(value);
      tempPro.id = 1;
      this.CarritosList.add(tempPro);
    });
    // print(CarritosList);
    return this.CarritosList;
  }

  @override
  //delCarrito
  Future<List<Carritos>> delCarritos(Carritos carritodel) {
    throw UnimplementedError();
  }

  @override
  //putCarrito
  Future<List<Carritos>> putCarritos(Carritos carritoput) {
    throw UnimplementedError();
  }

  @override
  //postCarrito
  Future<List<Carritos>> postCarritos(Carritos carritopost) {
    throw UnimplementedError();
  }

  @override
  //updateCarrito
  Future<List<Carritos>> upCarritos(Carritos carritoup) {
    throw UnimplementedError();
  }
}
