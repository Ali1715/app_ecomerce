import 'package:application_ecommerce/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:application_ecommerce/services/services.dart';
import 'package:provider/provider.dart';
import 'package:application_ecommerce/models/models.dart';

class ProductoScreen extends StatelessWidget {
  //final Productos product = productoService().selectedProduct;
  @override
  Widget build(BuildContext context) {
    final productoServicio = Provider.of<productoService>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              ProductoImagen(url: productoServicio.selectedProduct.imagen),
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
          _detailsproducto(
            name: productoServicio.selectedProduct.name,
            precio: productoServicio.selectedProduct.precioUnitario,
            descripcion: productoServicio.selectedProduct.descripcion,
            stock: productoServicio.selectedProduct.stock,
          ),
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
  final String? name;
  final String? descripcion;
  final num? precio;
  final num? stock;
  // final String? url;
  const _detailsproducto(
      {Key? key, this.name, this.descripcion, this.precio, this.stock})
      : super(key: key);
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
            Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  color: Colors.white,
                  child: Text(
                    name.toString(),
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )),
            Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  color: Colors.white,
                  child: Text(
                    "\n" + 'Detalle :' + "\n" + descripcion.toString(),
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                )),
            Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  color: Colors.white,
                  child: Text(
                    'Bs.' + ' ' + precio.toString(),
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )),
            Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  color: Colors.white,
                  child: Text(
                    'Stock:' + ' ' + stock.toString(),
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                )),
            SizedBox(
              height: 70,
            ),
          ],
        )),
      ),
    );
  }

  BoxDecoration _buildBoxDecorationForm() => BoxDecoration(
          color: Colors.white,
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
