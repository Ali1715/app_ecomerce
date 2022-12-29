import 'dart:typed_data';
import 'dart:ui';

import 'package:application_ecommerce/models/carritomodel.dart';
import 'package:application_ecommerce/widgets/cart_product_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:application_ecommerce/models/models.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:provider/provider.dart';
import 'package:application_ecommerce/services/services.dart';
import 'package:application_ecommerce/widgets/widgets.dart';
import 'package:vxstate/vxstate.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productosService = Provider.of<productoService>(context);
    final carritoIcon Itemcount = new carritoIcon();
    //int _ItemCountadd = 0;
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: "Carrito".text.bold.size(20).make(),
      ),
      body: Column(
        children: [
          _Barseguimiento(),
          Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '                                   Carrito',
                  style: TextStyle(
                      height: 1, fontSize: 20, fontWeight: FontWeight.bold),
                  //textAlign: TextAlign.center,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '    Productos' +
                      '(' +
                      carritoIcon().addProductToCart().toString() +
                      ')',
                  style: TextStyle(
                      height: 2, fontSize: 17, fontWeight: FontWeight.bold),
                  //textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          VaciarCarrito(),
          _CartList().p16().expand(),
          Divider(thickness: 1),
          _CartSubTotal(
            product: productosService.selectedProduct,
          ),
          Divider(thickness: 1),
          _CartTotal(
            product: productosService.selectedProduct,
          ),
          ButtonNextInCartPage(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  final Productos product;
  const _CartTotal({
    Key? key,
    required this.product,
    // required this.cantidad,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //final Carritos _cart = (VxState.store as MyStore).cart;
    final Carritos? _cart;
    return Row(children: [
      Column(children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text('Total', style: Theme.of(context).textTheme.headline6),
        ),
      ]),
      Column(children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text(
              '                                                    \Bs.${product.precioUnitario.toString()}',
              style: TextStyle(color: Colors.orange, fontSize: 18)),
        )
      ]),
    ]);
  }
}

class _CartSubTotal extends StatelessWidget {
  final Productos product;
  const _CartSubTotal({
    Key? key,
    required this.product,
    // required this.cantidad,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //final Carritos _cart = (VxState.store as MyStore).cart;
    final Carritos? _cart;
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Column(children: [
          Align(
            alignment: Alignment.centerLeft,
            child:
                Text('Subtotal', style: Theme.of(context).textTheme.headline6),
          ),
        ]),
        Column(children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(
                '                                             \Bs.${product.precioUnitario.toString()}',
                style: TextStyle(color: Colors.orange, fontSize: 18)),
          )
        ]),
      ]),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productosService = Provider.of<productoService>(context);

    //VxState.watch(context, on: []); //RemoveMutation]);

    return Container(
        child: Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                  onTap: () {
                    // productosService.selectedProduct =
                    //   productosService.productos[index].copy();
                    //Navigator.pushNamed(context, 'Producto');
                  },
                  child: CartProductoCart(
                    product: productosService.selectedProduct,
                  ))),
        ),
      ],
    ));
  }
}

/**********CirculoBar Seguimiento*************** */

class _Barseguimiento extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RatingBar(
      minRating: 1,
      maxRating: 4,
      initialRating: 1,
      allowHalfRating: true,
      //onRaUp
      onRatingUpdate: (value) {},
      itemSize: 30,
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      //  glowColor: Colors.lightGreen,
      glowRadius: 5,
      updateOnDrag: true,
      ratingWidget: RatingWidget(
        full: Icon(
          Icons.circle_sharp,
          color: Colors.red,
        ),
        half: circle(),
        empty: Icon(
          Icons.circle_sharp,
          color: Color.fromARGB(96, 247, 195, 201),
        ),
      ),
    );
  }
}

class ButtonNextInCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: new Column(
      children: <Widget>[
        new ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.redAccent,
            //color: Colors.blue,
          ),
          child: Text('Confirmar'),
          onPressed: () => {},
        ),
      ],
    ));
  }
}

class VaciarCarrito extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final Carritos _cart = (VxState.store as MyStore).cart;
    //final Carritos? _cart;
    return Row(children: [
      WidthBox(260),
      Text('Vaciar Carrito', style: TextStyle(color: Colors.red)),
      IconButton(onPressed: () {}, icon: Icon(Icons.delete_forever_rounded)),
    ]);
  }
}
