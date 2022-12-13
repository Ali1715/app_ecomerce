import 'package:flutter/material.dart';

class loadingHomeProductos extends StatelessWidget {
  const loadingHomeProductos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
      ),
      body: Center(
          child: CircularProgressIndicator(
        color: Colors.red,
      )),
    );
  }
}
