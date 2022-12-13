import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

Carritos CarritoFromJson(String str) => Carritos.fromJson(json.decode(str));
String carritoToJson(Carritos data) => json.encode(data.toJson());

class Carritos {
  final String idCliente;
  final String estado;
  final String total;
  final int? fechaHora;

  const Carritos({
    required this.idCliente,
    required this.estado,
    required this.total,
    this.fechaHora,
  });

  factory Carritos.fromJson(Map<String, dynamic> json) => Carritos(
        idCliente: json["idCliente"],
        estado: json["estado"],
        total: json["total"],
        fechaHora: json["fechaHora"],
      );

  Map<String, dynamic> toJson() => {
        "idCliente": idCliente,
        "estado": estado,
        "total": total,
        "fechaHora": fechaHora,
      };
}
