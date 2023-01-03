import 'package:application_ecommerce/models/carritomodel.dart';
import 'package:application_ecommerce/repository/ClienteRepository.dart';
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
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
import 'package:printing/printing.dart';

/******************CartPage*********************************************** */
class UltimoPaso extends StatelessWidget {
  static const String routeName = '/UltimoPaso';
  static Route route() {
    return MaterialPageRoute(
        builder: (context) => UltimoPaso(),
        settings: RouteSettings(name: routeName));
  }

  const UltimoPaso({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: "¡Último paso!".text.bold.size(20).make(),
      ),
      body: Container(
        color: Colors.black12,
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
            alignment: Alignment.center,
            color: Colors.white,
            margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  'Cliente',
                ),
                Text(
                  'Name',
                  style: Theme.of(context).textTheme.bodyText1,
                )
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  'CI:' + '9814089',
                ),
                //Text('9814089')
              ]),
              SizedBox(
                height: 40.0,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Items',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                //Text('9814089')
              ]),
              SizedBox(
                height: 30.0,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text(
                  'Producto:',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                //Text('9814089')
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  'Hp Laptop',
                ),
                Text(
                  'Bs 4360',
                  style: Theme.of(context).textTheme.bodyText1,
                )
              ]),
              Divider(thickness: 0.5),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  'Cantidad',
                ),
                Text(
                  '1',
                  style: Theme.of(context).textTheme.bodyText1,
                )
              ]),
              Divider(thickness: 0.5),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  'Subtotal',
                ),
                Text(
                  '00.00',
                  style: Theme.of(context).textTheme.bodyText1,
                )
              ]),
              Divider(thickness: 0.5),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  'Costo de Envio',
                ),
                Text(
                  '00.00',
                  style: Theme.of(context).textTheme.bodyText1,
                )
              ]),
              SizedBox(height: 20.0),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  'Pago:' + 'Tigo Money',
                ),
              ]),
              SizedBox(height: 20.0),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Total:',
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(width: 90.0),
                Text(
                  '00.00',
                  style: Theme.of(context).textTheme.headline5,
                )
              ]),
            ])),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.picture_as_pdf_sharp),
          onPressed: () {
            //dESCARGAR EN PDF
            Navigator.pushNamed(context, '/pdf');
          }),
    );
  }
}
