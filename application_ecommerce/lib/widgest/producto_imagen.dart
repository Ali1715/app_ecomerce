import 'package:flutter/material.dart';

class ProductoImagen extends StatelessWidget {
  //const ProductoImagen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Container(
        decoration: _buildBoxDecorationImagen(),
        width: double.infinity,
        height: 400,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45)),
          child: FadeInImage(
            //image: NetworkImage('https://via.placeholder.com/400x300/green'),
            image: AssetImage('assets/Laptop_HP_De_15_6_Pulgadas.png'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

BoxDecoration _buildBoxDecorationImagen() => BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45), topRight: Radius.circular(45)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, 5))
        ]);
