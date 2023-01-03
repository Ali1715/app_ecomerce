import 'dart:ffi';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';
import 'package:application_ecommerce/router/router.dart';
import 'package:equatable/equatable.dart';
import 'package:application_ecommerce/models/carritomodel.dart';
import 'package:application_ecommerce/widgets/CarritoScreen.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:application_ecommerce/models/models.dart';
import 'package:http/http.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:provider/provider.dart';
import 'package:application_ecommerce/services/services.dart';
import 'package:application_ecommerce/widgets/widgets.dart';
import 'package:vxstate/vxstate.dart';
import 'package:flutter/src/widgets/framework.dart';

/******************CartPage*********************************************** */
class CartPage extends StatefulWidget {
  const CartPage({super.key});
  @override
  State<CartPage> createState() => _CartPage();
}

class _CartPage extends State<CartPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productosService = Provider.of<productoService>(context);
    // final cartIconadd = Provider.of<carritoIcon>(context);
    final carritoIcon Itemcount = new carritoIcon();

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
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '    Productos' +
                      '(' +
                      productosService.listselectProductos.length.toString() +
                      // anadir cant de productos en carrito
                      ')',
                  style: TextStyle(
                      height: 2, fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
/****************************************************************************************** */
          VaciarCarrito(),
          //if (productosService.isLoading)
          if (productosService.listselectProductos.length != 0)
            (_CartList().p16().expand())
          else
            Container(
              height: 305,
            ),
          Divider(thickness: 1),
          if (productosService.listselectProductos.length != 0)
            (CartSubTotal(
              product: productosService.selectedProduct,
            ))
          else
            (Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Column(children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Subtotal',
                      style: Theme.of(context).textTheme.headline6),
                  //Sumar totales y mostrar
                ),
              ]),
              Column(children: [
                Align(
                  alignment: Alignment.centerRight,
                  child:
                      //cargar el total
                      Text('Bs:0000',
                          style: TextStyle(color: Colors.orange, fontSize: 18)),
                )
              ]),
            ])),
          if (productosService.listselectProductos.length != 0)
            (CostoEnvio(
              product: productosService.selectedProduct,
            ))
          else
            (Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Column(children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Costo de Envio',
                      style: Theme.of(context).textTheme.headline6),
                  //Sumar totales y mostrar
                ),
              ]),
              Column(children: [
                Align(
                  alignment: Alignment.centerRight,
                  child:
                      //cargar el total
                      Text('Bs:0000',
                          style: TextStyle(color: Colors.orange, fontSize: 18)),
                )
              ]),
            ])),
          Divider(thickness: 1),
          if (productosService.listselectProductos.length != 0)
            (CartTotal(
              product: productosService.selectedProduct,
            ))
          else
            (Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Column(children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Total',
                      style: Theme.of(context).textTheme.headline6),
                  //Sumar totales y mostrar
                ),
              ]),
              Column(children: [
                Align(
                  alignment: Alignment.centerRight,
                  child:
                      //cargar el total
                      Text('Bs:0000',
                          style: TextStyle(color: Colors.orange, fontSize: 18)),
                )
              ]),
            ])),

          Divider(thickness: 1),
          ButtonNextInCartPage(),
        ],
      ),
    );
  }
}

/*********************CartTotal******************************************************* */

class CartTotalPp extends StatelessWidget {
  final Productos product;
  const CartTotalPp({
    Key? key,
    required this.product,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text('${product.precioUnitario.toString()}');
  }
}

class CartTotal extends StatelessWidget {
  final Productos product;
  // final Carritos carritototal;
  const CartTotal({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Carritos? _cart;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(children: [
            Align(
              alignment: Alignment.centerLeft,
              child:
                  Text('Total', style: Theme.of(context).textTheme.headline6),
              //Sumar totales y mostrar
            ),
          ]),
          Column(children: [
            Align(
              alignment: Alignment.centerRight,
              child:
                  //cargar el total
                  Text('\Bs.${product.precioUnitario.toString()}',
                      style: TextStyle(color: Colors.orange, fontSize: 18)),
            )
          ]),
        ]));
  }
}

/*****************aqui hacer la funcion para sumar costos**************** */
/*class Costo {
  int C = 0;
  @override
  Widget build(BuildContext context) {
    final productosService = Provider.of<productoService>(context);
    //C = _CartSubTotal(product: productosService.selectedProduct).toString();

    return Text('${C}');
  }
}*/

/************************Cart Subtotal***************************************************** */
class CostoSubTotalP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productosService = Provider.of<productoService>(context);
    return CartSubTotal(product: productosService.selectedProduct);
  }
}

class CartSubTotal extends StatelessWidget {
  final Productos product;
  const CartSubTotal({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Carritos? _cart;

    // double get subtotal=> product
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
            child:
                //carga la cantidad de subtotal que debe ser la cantidad de cada producto por su precio,
                Text('\Bs.${product.precioUnitario.toString()}',
                    style: TextStyle(color: Colors.orange, fontSize: 18)),
          )
        ]),
      ]),
    );
  }
}

/********************Costo de Envio*************************************************************** */
class CostoEnvioP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productosService = Provider.of<productoService>(context);
    return CostoEnvio(product: productosService.selectedProduct);
  }
}

class CostoEnvio extends StatelessWidget {
  final Productos product;
  const CostoEnvio({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Carritos? _cart;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text('Costo de Envio',
                style: Theme.of(context).textTheme.headline6),
          ),
        ]),
        Column(children: [
          Align(
            alignment: Alignment.centerRight,
            child:
                //cargar el costo de envio
                Text('\Bs.0000',
                    style: TextStyle(color: Colors.orange, fontSize: 18)),
          )
        ]),
      ]),
    );
  }
}

/*************************Widget-CartList*******************************************************/
class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productosService = Provider.of<productoService>(context);
    return Container(
        child: Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount: productosService.listselectProductos.length,
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                  onTap: () {},
                  //carga el producto seleccionado

                  child: CartProductoCart(
                    product: productosService.listselectProductos[index],
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
      onRatingUpdate: (value) {},
      itemSize: 30,
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
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

/***************************Boton Red Confirmar*********************************************** */
class ButtonNextInCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: new Column(
      children: <Widget>[
        new ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.redAccent,
          ),
          child: Text('Continuar'),
          onPressed: () =>
              {Navigator.pushNamed(context, '/DatoCartClienteScreen')},
        ),
      ],
    ));
  }
}

/************************VaciarCarrito******************************************************* */
class VaciarCarrito extends StatefulWidget {
  @override
  State<VaciarCarrito> createState() => VaciarCarritoState();
}

class VaciarCarritoState extends State<VaciarCarrito> {
  var list;
  var random;
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  @override
  void initState() {
    super.initState();
    random = Random();
    refreshList();
    RefreshIndicator(child: CartPage(), onRefresh: refreshList);
  }

  Future<Null> refreshList() async {
    refreshKey.currentState?.show();
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      list = List.generate(random.nextInt(10), (i) => "Item $i");
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final productosService = Provider.of<productoService>(context);
    return Row(children: [
      WidthBox(260),
      Text('Vaciar Carrito', style: TextStyle(color: Colors.red)),
      IconButton(
          onPressed: () {
            setState(() {
              productosService.listselectProductos.clear();
              Future.microtask(() {
                Navigator.pushNamed(context, 'Carrito_Page');

                transitionDuration:
                Duration(seconds: 0);
              });
              // refreshList();
              //Navigator.pushNamed(context, 'Carrito_Page');
            });
          },
          icon: Icon(Icons.delete_forever_rounded)),
    ]);
  }
}
