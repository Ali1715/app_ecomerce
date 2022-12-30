import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

Detalle_Carritos CarritoFromJson(String str) =>
    Detalle_Carritos.fromJson(json.decode(str));
String carritoToJson(Detalle_Carritos data) => json.encode(data.toJson());

class Detalle_Carritos {
  int? id;
  final int cantidad;
  final num? precio;
  final int? idCarrito;
  final int? idProducto;

  Detalle_Carritos({
    this.id,
    required this.cantidad,
    required this.precio,
    required this.idCarrito,
    required this.idProducto,
  });

  factory Detalle_Carritos.fromJson(Map<String, dynamic> json) =>
      Detalle_Carritos(
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
