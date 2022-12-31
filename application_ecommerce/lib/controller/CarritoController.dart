import 'package:application_ecommerce/repository/Repository.dart';
import 'package:application_ecommerce/models/carritomodel.dart';
import 'package:application_ecommerce/repository/Repository.dart';

class CarritoController {
  final RepositoryCarrito RepCarrito;
  CarritoController(this.RepCarrito);

  //get
  Future<List<Carritos>> fetchCarritoList() async {
    return RepCarrito.getCarritos();
  }
  //post

}
