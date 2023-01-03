import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

Factura CarritoFromJson(String str) => Factura.fromJson(json.decode(str));
String carritoToJson(Factura data) => json.encode(data.toJson());

class Factura {
  int? id;
  final int cantidad;
  final num? precio;
  final int? idCarrito;
  final int? idProducto;

  Factura({
    this.id,
    required this.cantidad,
    required this.precio,
    required this.idCarrito,
    required this.idProducto,
  });

  factory Factura.fromJson(Map<String, dynamic> json) => Factura(
        id: json["id"],
        cantidad: json["cantidad"],
        precio: json["precio"],
        idCarrito: json["idCarrito"],
        idProducto: json["idProducto"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cantidad": cantidad,
        "precio": precio,
        "idCarrito": idCarrito,
        "idProducto": idProducto,
      };
}
