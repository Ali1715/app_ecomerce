import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:application_ecommerce/models/models.dart';

class CartProducto extends StatelessWidget {
  const CartProducto({
    Key? key,
    required this.producto,
    required this.cantidad,
  }) : super(key: key);

  final Productos producto;
  final int cantidad;

  @override
  Widget build(BuildContext context) {
    final String? url;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.network(
            'http://192.168.0.16:8000/public/img/' + producto.imagen!,
            fit: BoxFit.cover,
            width: 100,
          )
        ],
      ),
    );
  }
}
