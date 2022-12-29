import 'package:application_ecommerce/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:application_ecommerce/models/models.dart';
import 'package:vxstate/vxstate.dart';

class CartProductoCart extends StatelessWidget {
  _State createState() => new _State();

  final Productos product;
  int count = 0;
  CartProductoCart({
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
          'http://192.168.0.16:8000/public/img/' + product.imagen!,
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
            Row(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.remove_circle)),
                // Text(_State().count.toString()),
                Text(' ${count}'),
                IconButton(
                    onPressed: () => {
                          incrementCounter(),
                        },
                    icon: Icon(Icons.add_circle)),
              ],
            )
          ],
        ),
      ],
    );
  }

  void incrementCounter() {
    _State().setState(() {
      count++;
    });
  }
}

class _State extends State {
  int count = 0;

  void incrementCounter() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter Tutorial - googleflutter.com'),
      ),
      body: Container(
        child: Column(children: <Widget>[
          IconButton(
            onPressed: () => {incrementCounter()},
            icon: Icon(Icons.add_circle),
          ),
          new Text('Button Clicks - ${count}')
        ]),
      ),
    );
  }
}
