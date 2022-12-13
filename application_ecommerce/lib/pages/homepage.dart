import 'dart:convert';
import 'package:application_ecommerce/pages/pages.dart';
import 'package:application_ecommerce/models/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:application_ecommerce/widgest/widgests.dart';
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
              icon: Icon(Icons.shopping_cart))
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

            /*  FutureBuilder<List<Productos>>(
              future: _catalogoShow(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                      itemCount: snapshot.data!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: EdgeInsets.all(5),
                            child: Container(
                                decoration: new BoxDecoration(
                                    image: new DecorationImage(
                                        image: new NetworkImage(
                                            snapshot.data.toString()),
                                        fit: BoxFit.cover))));
                      });
                }
                return Center(child: CircularProgressIndicator());
              },
            ),*/
            Expanded(
                child: ListView.builder(
              itemCount: productosService.productos.length,
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                  onTap: () => Navigator.pushNamed(context, 'Producto'),
                  child: ProductCard(
                    product: productosService.productos[index],
                  )),
            ))
          ],
        ),
      ),
    );
  }

  /*Future<List<Productos>> _catalogoShow1() async {
    try {
      var response = await Dio().get("http://127.0.0.1:8000/api/catalogo");

      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }*/

/*****************************


  Future<List<Productos>> _catalogoShow() async {
    //   Dio dio = Dio();
    //try {
    final response =
        await http.get(Uri.parse('http://192.168.0.18:8000/api/catalogo'));
    // .timeout(Duration(seconds: 5));

    if (response.statusCode == 200) {
      // return compute(parseGalleryData, response.body);
      //    final body = utf8.decode(response.bodyBytes);
      List<dynamic> jsonData = response.bodyBytes;
      print(jsonData);
      List<Productos> items = [];
      for (dynamic item in jsonData) {
        items.add(Productos.fromJson(item));
      }

      return items;
    } else {
      print("Error");
      return [];
    }
    //  } catch (e) {
    //   throw Exception('Failed to load');
    // }
  }




  *****************************/

  /*List<String> parseGalleryData(String responseBody) {
    final parsed = List<String>.from(json.decode(responseBody));
    return parsed;
  }*/
}
