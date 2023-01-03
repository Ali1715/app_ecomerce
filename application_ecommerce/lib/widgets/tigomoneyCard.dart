import 'package:flutter/material.dart';

class TigoCard extends StatelessWidget {
  //const ProductoImagen({super.key});
  //final String? url;
  // const TigoCard({Key? key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Expanded(
          child: InkWell(
            child: Container(
              decoration: _buildBoxDecorationImagen(),
              width: double.infinity,
              height: 200,
              child: ClipRRect(
                child: //this.url == null
                    FadeInImage(
                  //image: NetworkImage('https://via.placeholder.com/400x300/green'),
                  placeholder: AssetImage('assets/tigomoney.png'),
                  image: AssetImage('assets/tigomoney.png'),
                  // placeholder: AssetImage('assets/jar-loading.gif'),
                  // image: NetworkImage(
                  //   'http://192.168.0.16:8000/public/img/' + this.url!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/PagoAlbumPage');
            },
          ),
        ));
  }
}

BoxDecoration _buildBoxDecorationImagen() => BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45), topRight: Radius.circular(45)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, 5))
        ]);
