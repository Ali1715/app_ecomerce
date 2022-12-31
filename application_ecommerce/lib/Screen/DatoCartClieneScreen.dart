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

/******************CartPage*********************************************** */
class DatoCartClienteScreen extends StatelessWidget {
  static const String routeName = '/DatoCartClienteScreen';
  static Route route() {
    return MaterialPageRoute(
        builder: (context) => DatoCartClienteScreen(),
        settings: RouteSettings(name: routeName));
  }

  const DatoCartClienteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productosService = Provider.of<productoService>(context);
    final carritoIcon Itemcount = new carritoIcon();
    var Clienetcontroller = ClienteController(ClienteRepository());
    //Clienetcontroller.fetchClientesList();
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: "Checkout".text.bold.size(20).make(),
      ),
      body: FutureBuilder<List<Clientes>>(
        future: Clienetcontroller.fetchClientesList(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('ERROR'),
            );
          }
          return ListView.separated(
            itemBuilder: (context, index) {
              var clientetodo = snapshot.data?[index];
              return Container(
                height: 20.0,
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Row(children: [
                  Expanded(child: Text('Name ${clientetodo?.name}')),
                ]),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(thickness: 1, height: 25);
            },
            itemCount: snapshot.data?.length ?? 0,
          );
        },
      ),
      /*Column(
        children: [
          _Barseguimiento(),
          Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '                            Datos de Envio',
                  style: TextStyle(
                      height: 1, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Column( 
            children: [
              InformacionCliente(),
            ],
          ),
          Column(
            children: [
              SizedBox(height: 0),
              Divider(thickness: 1),
              ButtonNextInDirPage(),
            ],
          ),
        ],
      ),*/
    );
  }
}

/******************InformacionCliente********************************* */
class InformacionCliente extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dirController = TextEditingController();
  //final TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Informacion de Cliente',
            style: Theme.of(context).textTheme.headline6,
          ),
          _buildTextFormField(emailController, context, 'Email'),
          //  SizedBox(height: 100),
          Text(
            'Direccion de Envio',
            style: Theme.of(context).textTheme.headline6,
          ),
          //SizedBox(height: 100),
          Text(
            'Costo de Orden',
            style: Theme.of(context).textTheme.headline6,
          ),
          // SizedBox(height: 100),
        ],
      ),
    );
  }

  Padding _buildTextFormField(
    TextEditingController controller,
    BuildContext context,
    String labelText,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: [
        SizedBox(
          width: 80,
          child: Text(
            labelText,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        )
      ]),
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
