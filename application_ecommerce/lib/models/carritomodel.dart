import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class Carritos {
  int? id;
  final String idCliente;
  final String estado;
  final String total;
  final int? fechaHora;

  Carritos({
    this.id,
    required this.idCliente,
    required this.estado,
    required this.total,
    this.fechaHora,
  });

  factory Carritos.fromJson(String str) => Carritos.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());

  factory Carritos.fromMap(Map<String, dynamic> json) => Carritos(
        id: json["id"],
        idCliente: json["idCliente"],
        estado: json["estado"],
        total: json["total"],
        fechaHora: json["fechaHora"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "idCliente": idCliente,
        "estado": estado,
        "total": total,
        "fechaHora": fechaHora,
      };
}
