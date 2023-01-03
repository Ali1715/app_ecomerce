import 'package:application_ecommerce/Screen/homeScreen.dart';
import 'package:application_ecommerce/models/models.dart';
import 'package:application_ecommerce/Screen/carritoScreen.dart';
import 'package:application_ecommerce/services/producto_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:application_ecommerce/services/services.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  //const ProductCard({super.key});

  /// A nullable type.
  final Productos product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, bottom: 20),
      width: 400,
      height: 200,
      //width: double.infinity,
      //height: 400,
      decoration: _cardBordes(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          _backgroundImage(product.imagen),
          _ProductDetalles(product),
          Positioned(top: 0, right: 0, child: _PrecioTag(product)),
          // Positioned(top: 0, left: 0, child: _enOferta()),
          //Positioned(top: 150, left: 320, child: carritoIcon()),
        ],
      ),
    );
  }

  BoxDecoration _cardBordes() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
                color: Colors.black38, offset: Offset(0, 5), blurRadius: 10)
          ]);
}

class _backgroundImage extends StatelessWidget {
  final String? url;
  const _backgroundImage(this.url);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        //width: double.infinity,
        //height: 400,
        width: 200,
        height: 200,
        child: FadeInImage(
          placeholder: AssetImage('assets/no-image.png'),
          image: NetworkImage('http://192.168.0.11:8000/public/img/' + url!),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _ProductDetalles extends StatelessWidget {
  //var name = productoService().name;
  final Productos producto;
  const _ProductDetalles(this.producto);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 50),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 70,
        decoration: _buildBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              producto.name,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              producto.descripcion,
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            //if
            Text(
              producto.stock.toString(),
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25), topRight: Radius.circular(25)));
}

class _PrecioTag extends StatelessWidget {
  final Productos producto;
  const _PrecioTag(this.producto);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: (Text(
            '\Bs' + producto.precioUnitario.toString(),
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )),
        ),
      ),
      width: 100,
      height: 70,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25), bottomLeft: Radius.circular(25))),
    );
  }
}

//Mostrar de manera condicional
/*class _enOferta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: (Text(
            'Oferta?',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )),
        ),
      ),
      width: 80,
      height: 70,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.amber.shade600,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), bottomRight: Radius.circular(25))),
    );
  }
}*/

class carritoIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  int index =
    //  int _ItemCountadd = 1;
    final productosService = Provider.of<productoService>(context);
    return Container(
        child: Column(
      children: <Widget>[
        IconButton(
            onPressed: () {
              // productosService.selectedProduct =
              //        productosService.productos[index].copy();

              Navigator.pushNamed(context, 'Producto');
            },
            icon: Icon(Icons.shopping_cart))
      ],
    ));
  }
}

class addPro {}

/*int cantidadProducto(int num) {
    //VxState.watch(context, on: []); //RemoveMutation]);

    //  final store = MyStore();
    //final Carritos _cart = (VxState.store as MyStore).cart;
    //return _cart.items.isEmpty
  
    _cart += num;

    return (_cart);
  }

*/
