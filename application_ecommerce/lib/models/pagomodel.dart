import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class Pago {
  int? id;
  final String ctaOrd;
  final int monto;
  final int costoEnv;
  final int idTrans;
  String? fechaHora;
  final int id_tipoPago;

  Pago({
    this.id,
    required this.ctaOrd,
    required this.monto,
    required this.costoEnv,
    required this.idTrans,
    this.fechaHora,
    required this.id_tipoPago,
  });

  factory Pago.fromJson(String str) => Pago.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());

  factory Pago.fromMap(Map<String, dynamic> json) => Pago(
        id: json["id"],
        ctaOrd: json["ctaOrd"],
        monto: json["monto"],
        costoEnv: json["costoEnv"],
        idTrans: json["idTrans"],
        fechaHora: json["fechaHora"],
        id_tipoPago: json["id_tipoPago"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "ctaOrd": ctaOrd,
        "monto": monto,
        "costoEnv": costoEnv,
        "idTrans": ctaOrd,
        "fechaHora": fechaHora,
        "id_tipoPago": id_tipoPago,
      };

  Pago copy() => Pago(
        id: this.id,
        ctaOrd: this.ctaOrd,
        monto: this.monto,
        costoEnv: this.costoEnv,
        idTrans: this.idTrans,
        fechaHora: this.fechaHora,
        id_tipoPago: this.id_tipoPago,
      );
}

/**************************************************** */
class PagoDatos {
  final int? id;
  final String ctaOrd;
  final String monto;
  final String costoEnv;
  final String idTrans;
  final String id_tipoPago;

  const PagoDatos({
    this.id,
    required this.ctaOrd,
    required this.monto,
    required this.costoEnv,
    required this.idTrans,
    required this.id_tipoPago,
  });

  factory PagoDatos.fromJson(Map<String, dynamic> json) {
    return PagoDatos(
      id: json["id"],
      ctaOrd: json["ctaOrd"],
      monto: json["monto"],
      costoEnv: json["costoEnv"],
      idTrans: json["idTrans"],
      id_tipoPago: json["id_tipoPago"],
    );
  }
}
