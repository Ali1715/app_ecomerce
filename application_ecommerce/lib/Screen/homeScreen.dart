import 'dart:convert';

import 'package:application_ecommerce/controller/CarritoController.dart';
import 'package:application_ecommerce/models/usermodel.dart';
import 'package:application_ecommerce/repository/CarritoRepository.dart';
import 'package:application_ecommerce/Screen/Screen.dart';
import 'package:application_ecommerce/models/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:application_ecommerce/widgets/widgets.dart';
import 'package:application_ecommerce/services/services.dart';
import 'package:provider/provider.dart';
//import 'package:application_ecommerce/providers/providers.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/Homepage';
  static Route route() {
    return MaterialPageRoute(
        builder: (context) => DatoCartClienteScreen(),
        settings: RouteSettings(name: routeName));
  }

  const HomePage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    //
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productosService = Provider.of<productoService>(context);
    final user = User();
    //final name=''

    if (productosService.isLoading) return loadingHomeProductos();

    return Scaffold(
      appBar: AppBar(
        title: Text("Ecomerce"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 252, 7, 7),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartPage()),
                );
              },
              icon: Icon(Icons.shopping_cart)),
          IconButton(
            icon: const Icon(
              Icons.logout_outlined,
              size: 32,
            ),
            onPressed: () {
              logout().then((value) => {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                        (route) => false)
                  });
            },
          ),
        ],
      ),
      drawer: Container(
        width: 300,
        // padding: EdgeInsets.only(right: 100.0),
        color: Colors.white,
        child: ListView(
          // Important: Remove any padding from the ListView.
          //padding: EdgeInsets.only(right: 100.0),
          children: <Widget>[
            // _buildHeader(
            // name: getUserName(),
            //   ),

            //Navigator.of(context)

            ListTile(
              title: const Text('Galvin Golden'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('g@gmail.com'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            Container(
              height: 80,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: "Buscar",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Productos",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: productosService.productos.length,
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                  onTap: () {
                    productosService.selectedProduct =
                        productosService.productos[index].copy();

                    Navigator.pushNamed(context, 'Producto');
                  },
                  child: Column(children: [
                    ProductCard(
                      product: productosService.productos[index],
                    ),
                    Column(
                      children: <Widget>[
                        IconButton(
                            onPressed: () {
                              productosService.selectedProduct =
                                  productosService.productos[index].copy();
                              productosService.listselectProductos
                                  .add(productosService.selectedProduct);

                              //Navigator.pushNamed(context, 'Producto');
                            },
                            icon: Icon(Icons.shopping_cart))
                      ],
                    )
                  ])),
            )),
          ],
        ),
      ),
      /*FutureBuilder<List<Carritos>>(
                future: CartController.fetchCarritoList(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error'),
                    );
                  }
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        var todo = snapshot.data?[index];
                        return Container(
                          height: 80,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            children: [
                              Expanded(flex: 1, child: Text('1')),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(thickness: 0.5, height: 0.5);
                      },
                      itemCount: snapshot.data?.length ?? 0);
                })*/
    );
  }
}

class _buildHeader extends StatelessWidget {
  final Future<String> name;
  // required VoidCallback onClicked,

  const _buildHeader({
    Key? key,
    required this.name,
    // required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //name:
    //getUserName().toString();
    //email:user.email,
    return Container(
      child: Text(name.toString()),
    );
  }

  onClicked() {
    //Navigator.push(context, 'UserPage');
  }
}
