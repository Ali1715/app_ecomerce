import 'package:application_ecommerce/Screen/loginScreen.dart';
import 'package:application_ecommerce/router/router.dart';
import 'package:application_ecommerce/services/services.dart';
import 'package:application_ecommerce/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:application_ecommerce/Screen/Screen.dart';
import 'package:application_ecommerce/models/models.dart';
import 'package:application_ecommerce/providers/providers.dart';
import 'package:provider/provider.dart';
import 'package:vxstate/vxstate.dart';
import 'package:application_ecommerce/widgets/widgets.dart';
import 'package:application_ecommerce/Screen/register_screen.dart';
import 'package:application_ecommerce/services/auth_service.dart';
import 'package:application_ecommerce/Screen/check_auth_screen.dart';


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
          create: (_) => productoService()),
          ChangeNotifierProvider(create: (_) => AuthService()),
        // Provider<_MyHomePageState>(create: (_) => _MyHomePageState()),,
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
       
        primarySwatch: Colors.orange,
      ),
      routes: {
        //  'Catalogo_page': (context) => CatalogoPage(),

        'Carrito_Page': (context) => CartPage(),
        'home': (context) => HomePage(),
        'Producto': (context) => ProductoScreen(),
         'checking': (_) => CheckAuthScreen(),
        'login': (context) => LoginScreen(),
        'register': (_) => RegisterScreen(),
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
   
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
    
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
