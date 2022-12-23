import 'package:application_ecommerce/models/carritomodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:application_ecommerce/models/models.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:provider/provider.dart';
import 'package:application_ecommerce/services/services.dart';
import 'package:application_ecommerce/widgets/widgets.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: "Cart".text.bold.size(20).make(),
      ),
      body: Column(
        children: [
          _Barseguimiento(),
          Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '       Productos',
                  style: TextStyle(
                      height: 3, fontSize: 18, fontWeight: FontWeight.bold),
                  //textAlign: TextAlign.left,
                ),
              )
            ],
          ),
          _CartList().p32().expand(),
          Divider(),
          //  _CartTotal(),

          ButtonNextInCartPage(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final Carritos _cart = (VxState.store as MyStore).cart;
    final Carritos? _cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            notifications: {},
            mutations: {}, //RemoveMutation},
            builder: (context, _, __) {
              // return "\$${_cart.total}"
              return "\$".text.xl5.color(context.theme.accentColor).make();
            },
          ),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: "Buying not supported yet.".text.make(),
                ),
              );
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(context.theme.buttonColor),
            ),
            child: "Buy".text.white.make(),
          ).w32(context),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productosService = Provider.of<productoService>(context);
    VxState.watch(context, on: []); //RemoveMutation]);
    //final Carritos _cart = (VxState.store as MyStore).cart;
    //return _cart.items.isEmpty
    return Container(
        // ? "Nothing to show".text.xl3.makeCentered()
        /*       ListView.builder(
      //  itemCount: _cart.items.length,

      itemCount: 3,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          icon: Icon(Icons.remove_circle_outline),
          onPressed: () {
            // RemoveMutation(_cart.items[index]);
            //setState(() {});
          },
        ),
        // title: _cart.items[index].name.text.make(),
      ),
    );
*/
        child: Column(children: <Widget>[
      Expanded(
          child: ListView.builder(
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                  onTap: () {
                    // productosService.selectedProduct =
                    //   productosService.productos[index].copy();
                    //Navigator.pushNamed(context, 'Producto');
                  },
                  child: ProductCard(
                    product: productosService.selectedProduct,
                  )))),
    ]));
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

/*class AddCarrito extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productosService = Provider.of<productoService>(context);
    return ProductCard(product: productosService.selectedProduct);
  }
}*/
