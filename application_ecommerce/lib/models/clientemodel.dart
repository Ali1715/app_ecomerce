import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class Clientes {
  int? id;
  final String name;
  final int ci;
  final String email;
  final String? sexo;
  final int celular;
  final String domicilio;
  final num? salario;
  final String? estadoemp;
  final String? estadocli;
  final int? tipoc;
  final int? tipoe;
  final int? iduser;

  Clientes(
      {this.id,
      required this.name,
      required this.ci,
      required this.email,
      required this.sexo,
      required this.celular,
      required this.domicilio,
      this.salario,
      this.estadoemp,
      this.estadocli,
      this.tipoc,
      this.tipoe,
      this.iduser});

  factory Clientes.fromJson(String str) => Clientes.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());

  factory Clientes.fromMap(Map<String, dynamic> json) => Clientes(
        id: json["id"],
        name: json["name"],
        ci: json["ci"],
        email: json["email"],
        sexo: json["sexo"],
        celular: json["celular"],
        domicilio: json["domicilio"],
        salario: json["salario"],
        estadoemp: json["estadoemp"],
        estadocli: json["estadocli"],
        tipoc: json["tipoc"],
        tipoe: json["tipoe"],
        iduser: json["iduser"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "ci": ci,
        "email": email,
        "sexo": sexo,
        "celular": celular,
        "domicilio": domicilio,
        "salario": salario,
        "estadoemp": estadoemp,
        "estadocli": estadocli,
        "tipoc": tipoc,
        "tipoe": tipoe,
        "iduser": iduser,
      };
}
