import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

Clientes ClienteFromJson(String str) => Clientes.fromJson(json.decode(str));
String clienteToJson(Clientes data) => json.encode(data.toJson());

class Clientes {
  final int id;
  final String name;
  final String ci;
  final String email;
  final String sexo;
  final String celular;
  final String domicilio;
  final String? salario;
  final String? estadoemp;
  final String? estadocli;
  final String? tipoc;
  final String? tipoe;
  final String? iduser;

  const Clientes(
      {required this.id,
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

  factory Clientes.fromJson(Map<String, dynamic> json) => Clientes(
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

  Map<String, dynamic> toJson() => {
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
