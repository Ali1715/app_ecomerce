import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class TipoPago {
  String? id;
  final String nombre;
  String? qr;
  final String nroCta;

  TipoPago({
    this.id,
    required this.nombre,
    this.qr,
    required this.nroCta,
  });

  factory TipoPago.fromJson(String str) => TipoPago.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());

  factory TipoPago.fromMap(Map<String, dynamic> json) => TipoPago(
        id: json["id"],
        nombre: json["nombre"],
        qr: json["qr"],
        nroCta: json["nroCta"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
        "qr": qr,
        "nroCta": nroCta,
      };

  TipoPago copy() => TipoPago(
        id: this.id,
        nombre: this.nombre,
        qr: this.qr,
        nroCta: this.nroCta,
      );
}
