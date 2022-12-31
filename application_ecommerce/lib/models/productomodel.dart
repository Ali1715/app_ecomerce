import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

//Productos productoFromJson(String str) => Productos.fromJson(json.decode(str));
//String productoToJson(Productos data) => json.encode(data.toJson());

class Productos {
  int? id;
  final String name;
  final String descripcion;
  final int stock;
  final num? precioUnitario;
  final String imagen;
  final int? idcategoria;
  final int? idmarca;
  final String? created_at;
  final String? updated_at;

  Productos(
      {this.id,
      required this.name,
      required this.descripcion,
      required this.stock,
      this.precioUnitario,
      required this.imagen,
      this.idcategoria,
      this.idmarca,
      this.created_at,
      this.updated_at});

  factory Productos.fromJson(String str) => Productos.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());

  factory Productos.fromMap(Map<String, dynamic> json) => Productos(
        id: json["id"],
        name: json["name"],
        descripcion: json["descripcion"],
        stock: json["stock"],
        precioUnitario: json["precioUnitario"],
        imagen: json["imagen"],
        idcategoria: json["idcategoria"],
        idmarca: json["idmarca"],
        created_at: json["created_at"],
        updated_at: json["updated_at"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "descripcion": descripcion,
        "stock": stock,
        "precioUnitario": precioUnitario,
        "imagen": imagen,
        "idcategoria": idcategoria,
        "idmarca": idmarca,
        "created_at": created_at,
        "updated_at": updated_at,
      };

  Productos copy() => Productos(
        id: this.id,
        name: this.name,
        descripcion: this.descripcion,
        stock: this.stock,
        precioUnitario: this.precioUnitario,
        imagen: this.imagen,
        idcategoria: this.idcategoria,
        idmarca: this.idmarca,
        created_at: this.created_at,
        updated_at: this.updated_at,
      );
}
