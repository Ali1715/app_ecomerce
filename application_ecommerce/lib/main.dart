import 'package:application_ecommerce/Screen/loginScreen.dart';
import 'package:application_ecommerce/Screen/pdffactura.dart';
import 'package:application_ecommerce/router/router.dart';
import 'package:application_ecommerce/services/services.dart';
import 'package:application_ecommerce/services/tipo_pago_servive.dart';
import 'package:application_ecommerce/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:application_ecommerce/Screen/Screen.dart';
import 'package:application_ecommerce/models/models.dart';
import 'package:application_ecommerce/providers/providers.dart';
import 'package:provider/provider.dart';
import 'package:vxstate/vxstate.dart';
import 'package:application_ecommerce/widgets/widgets.dart';

void main() {
  runApp(AppEstado());
}

class AppEstado extends StatelessWidget {
  //const AppEstado({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => productoService(),
        ),
        // Provider<_MyHomePageState>(create: (_) => _MyHomePageState()),
        // ChangeNotifierProvider(
        Provider<tipopagoservice>(create: (_) => tipopagoservice())
        // )
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Productos App',
      initialRoute: 'login',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      routes: {
        //  'Catalogo_page': (context) => CatalogoPage(),

        'Carrito_Page': (context) => CartPage(),
        'home': (context) => HomePage(),
        'Producto': (context) => ProductoScreen(),
        'AddCarrito': (context) => CartPage(),
        'TipoPagoService': (context) => tipopagoservice(),
        'CarritoPage': (context) => CarritoPage(),

        // 'DatoCartCliente': (context) => DatoCartClienteScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var db = new Mysql();
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
