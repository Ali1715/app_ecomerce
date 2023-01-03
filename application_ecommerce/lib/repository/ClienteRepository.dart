import 'package:application_ecommerce/models/usermodel.dart';
import 'package:application_ecommerce/repository/Repository.dart';
import 'package:application_ecommerce/models/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class ClienteRepository implements RepositoryCliente {
  //int idusuarioauth=
  final User usuarioauth = User();
  String _baseUrl = 'http://192.168.0.16:8000/api/cliente';

  final List<Clientes> ClientesList = [];
  var productosresp = <Clientes>[];
  late Clientes selectedProduct;
  bool isLoading = true;

  productoService() {
    this.getClientes();
  }

  @override
  //getCarrito
  Future<List<Clientes>> getClientes() async {
    final url = Uri.parse(_baseUrl);
    final resp = await http.get(url);

    final List<dynamic> clienteMap = json.decode(resp.body);
    //print(productoMap);
    //for (var items in productoMap) {
    clienteMap.forEach((value) {
      final tempPro = Clientes.fromMap(value);
      tempPro.id = 1;
      this.ClientesList.add(tempPro);
    });
    // print(CarritosList);
    return ClientesList;
  }

  @override
  //delCarrito
  Future<List<Clientes>> delClientes(Clientes Clientesdel) {
    throw UnimplementedError();
  }

  @override
  //putCarrito
  Future<List<Clientes>> putClientes(Clientes Clientesput) {
    throw UnimplementedError();
  }

  @override
  //postCarrito
  Future<List<Clientes>> postClientes(Clientes Clientespost) {
    throw UnimplementedError();
  }

  @override
  //updateCarrito
  Future<List<Clientes>> upClientes(Clientes Clientesup) {
    throw UnimplementedError();
  }
}
