import 'package:application_ecommerce/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:application_ecommerce/models/models.dart';
import 'package:vxstate/vxstate.dart';

class CartProductoCart extends StatelessWidget {
  // _State createState() => new _State();

  final Productos product;
  const CartProductoCart({
    Key? key,
    required this.product,
    // required this.cantidad,
  }) : super(key: key);

  //final int cantidad;

  @override
  Widget build(BuildContext context) {
    final String? url;

    return Row(
      children: [
        Image.network(
          'http://192.168.0.11:8000/public/img/' + product.imagen,
          fit: BoxFit.cover,
          width: 100,
          height: 80,
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.name, style: Theme.of(context).textTheme.bodySmall),
            Text(
              '\Bs${product.precioUnitario}',
              //style: Theme.of(context).textTheme.bodyMedium ,
              style: TextStyle(color: Colors.orange),
            ),
            StateCount()
          ],
        ),
      ],
    );
  }

  // @override
  //State<CartProductoCart> createState() => _State();
  //stateful() => _ProductCartStateful();
}

class StateCount extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<StateCount> {
  int counter = 1;
  var db = new Mysql();
  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (counter > 1) {
        counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () => {
                  setState(() {
                    _decrementCounter();
                  })
                },
            icon: Icon(Icons.remove_circle)),
        // Text(_State().count.toString()),
        Text('$counter'),
        IconButton(
            onPressed: () => {
                  setState(() {
                    _incrementCounter();
                  })
                },
            icon: Icon(Icons.add_circle)),
      ],
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
