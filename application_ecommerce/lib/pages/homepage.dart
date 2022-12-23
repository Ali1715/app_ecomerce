import 'dart:convert';
import 'package:application_ecommerce/pages/pages.dart';
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
      drawer: SidebarX(
        controller: SidebarXController(selectedIndex: 0, extended: true),
        items: const [
          SidebarXItem(icon: Icons.home, label: 'Home'),
          SidebarXItem(icon: Icons.search, label: 'Search'),
        ],
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
                child: ProductCard(
                  product: productosService.productos[index],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
