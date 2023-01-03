import 'package:application_ecommerce/models/carritomodel.dart';
import 'package:application_ecommerce/repository/ClienteRepository.dart';
import 'package:application_ecommerce/services/tipo_pago_servive.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:application_ecommerce/models/models.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:provider/provider.dart';
import 'package:application_ecommerce/services/services.dart';
import 'package:application_ecommerce/widgets/widgets.dart';
import 'package:vxstate/vxstate.dart';
import 'package:application_ecommerce/controller/Controller.dart';

/******************CartPage*********************************************** */
class PagoScreen extends StatefulWidget {
  static const String routeName = '/PagoScreen';
  static Route route() {
    return MaterialPageRoute(
        builder: (context) => PagoScreen(),
        settings: RouteSettings(name: routeName));
  }

  const PagoScreen({super.key});

  @override
  _PagoScreenState createState() => _PagoScreenState();
}

class _PagoScreenState extends State<PagoScreen> {
  // final TipoPago tipopago = new TipoPago();
  String dropdownvalue = 'seleccionar';
  // List of items in our dropdown menu
  var items = [
    'seleccionar',
    'Tigo Money',
  ];

  @override
  Widget build(BuildContext context) {
    //final TipopagosService = Provider.of<TipoPago>(context);
    final TipoPago tipopago;

    return
        //CartSection
        Container(
            height: 80,
            child: (Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                    // Initial Value
                    value: dropdownvalue,

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ],
              ),
            ))
            // child: ListView.builder(itemBuilder: cards.length),
            );
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
class ButtonNextInDirPage extends StatelessWidget {
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
          onPressed: () => {Navigator.pushNamed(context, 'DirEnvio')},
        ),
      ],
    ));
  }
}

/*class DireccionCliente extends StatefulWidget {
  static const String routeName = '/DireccionCliente';
  static Route route() {
    return MaterialPageRoute(
        builder: (context) => DireccionCliente(),
        settings: RouteSettings(name: routeName));
  }

  const DireccionCliente({super.key});

  @override
  _DireccionCliente createState() => _DireccionCliente();
}

class _DireccionCliente extends State<DireccionCliente> {
  String dropdownvalue = 'Seleccionar';
  // List of items in our dropdown menu
  var items = [
    'Tigo Money',
    'Transferencia',
    'Visa Caerd',
    'Seleccionar',
  ];
  @override
  Widget build(BuildContext context) {
    return
        //CartSection

        DropdownButton(
      // Initial Value
      value: dropdownvalue,

      // Down Arrow Icon
      icon: const Icon(Icons.keyboard_arrow_down),

      // Array list of items
      items: items.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),
      // After selecting the desired option,it will
      // change button value to selected value
      onChanged: (String? newValue) {
        setState(() {
          dropdownvalue = newValue!;
        });
      },
    );
  }
}*/
