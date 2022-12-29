import 'package:flutter/material.dart';

class ProductoImagen extends StatelessWidget {
  //const ProductoImagen({super.key});
  final String? url;
  const ProductoImagen({Key? key, this.url}) : super(key: key);

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
          child: this.url == null
              ? Image(
                  image: AssetImage('assets/no-image.png'),
                  fit: BoxFit.cover,
                )
              : FadeInImage(
                  //image: NetworkImage('https://via.placeholder.com/400x300/green'),
                  // image: AssetImage('assets/Laptop_HP_De_15_6_Pulgadas.png'),
                  placeholder: AssetImage('assets/jar-loading.gif'),
                  image: NetworkImage(
                      'http://192.168.0.16:8000/public/img/' + this.url!),
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}

BoxDecoration _buildBoxDecorationImagen() => BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45), topRight: Radius.circular(45)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, 5))
        ]);
