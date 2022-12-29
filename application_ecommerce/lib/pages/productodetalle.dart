import 'package:application_ecommerce/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProductoDetalles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              ProductoImagen(),
              Positioned(
                top: 60,
                left: 20,
                child: IconButton(
                    icon: Icon(Icons.arrow_back_ios_new,
                        size: 40, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop()),
              ),
              /*  Positioned(
                top: 60,
                right: 20,
                child: IconButton(
                    icon: Icon(Icons.shopping_cart,
                        size: 40, color: Colors.white),
                    onPressed: () {
                      //Funcion que envia el producto al carrito
                    })),*/
            ],
          ),
          _detailsproducto(),
          SizedBox(height: 100),
        ]),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.shopping_cart),
          onPressed: () {
            //Llevar el producto al carrito
          }),
    );
  }
}

class _detailsproducto extends StatelessWidget {
  // const _detailsproduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        // height: 200,
        decoration: _buildBoxDecorationForm(),
        child: Form(
            child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            /* TextFormField(

                //
                ),*/
            Text(
              'Nombre:Laptop_HP_De_15_6_Pulgadas',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'Stock: 9',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              '\Precio: Bs2341,18',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 50,
            ),
          ],
        )),
      ),
    );
  }

  BoxDecoration _buildBoxDecorationForm() => BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: Offset(0, 5),
                blurRadius: 5)
          ]);
}
