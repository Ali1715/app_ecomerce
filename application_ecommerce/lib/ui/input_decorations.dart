import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecorations({
    required String hintText,
    required String labelText,
    IconData? prefixIcon,
  }) {
    return InputDecoration(
        // Activar linea, cuando esta seleccionado
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 183, 53, 1),
          ),
        ),
        // Aumenta el tamaño de la linea
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
          color: Color.fromARGB(255, 183, 53, 1),
          width: 2,
        )),
        hintText: hintText, // text dentro del input
        hintStyle: TextStyle(
          fontSize: 12,
          color: Colors.grey.withOpacity(0.5),
        ),
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 15,
        ),
        prefixIcon: prefixIcon != null // Si existe lo
            ? Icon(
                prefixIcon,
                color: Color.fromARGB(255, 183, 53, 1),
              )
            : null);
  }
}