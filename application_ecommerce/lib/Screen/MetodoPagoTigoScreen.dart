import 'package:application_ecommerce/models/carritomodel.dart';
import 'package:application_ecommerce/repository/ClienteRepository.dart';
import 'package:application_ecommerce/widgets/tigomoneyCard.dart';
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
class MetodoPagoTigoScreen extends StatefulWidget {
  static const String routeName = '/MetodoPagoTigoScreen';
  static Route route() {
    return MaterialPageRoute(
        builder: (context) => MetodoPagoTigoScreen(),
        settings: RouteSettings(name: routeName));
  }

  const MetodoPagoTigoScreen({super.key});

  @override
  _PagoTigoScreenState createState() => _PagoTigoScreenState();
}

class _PagoTigoScreenState extends State<MetodoPagoTigoScreen> {
  String dropdownvalue = 'Item 1';
  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.canvasColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: "Checkout".text.bold.size(20).make(),
        ),
        body:
            //CartSection
            Container(
                child: (Column(
          children: [
            SizedBox(height: 120),
            TigoCard(),
            SizedBox(
              height: 30,
            ),
            Text(
              'Asegúrate de tener saldo en Tigo Money',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 110),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(227, 255, 255, 255),
                    shadowColor: Color.fromARGB(224, 255, 255, 255)),
                onPressed: () =>
                    {Navigator.pushNamed(context, '/DatoCartClienteScreen')},
                child: Text(
                  'Agregar otro medio de pago',
                  style: TextStyle(color: Colors.black),
                )),
            SizedBox(height: 20),
            ButtonNext(),
          ],
        ))
                // child: ListView.builder(itemBuilder: cards.length),
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
class ButtonNext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: new Column(
      children: <Widget>[
        new ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(350.0, 30.0),
            primary: Colors.redAccent,
          ),
          child: Text('Elegir este medio de pago'),
          onPressed: () => {Navigator.pushNamed(context, '/UltimoPaso')},
        ),
      ],
    ));
  }
}
