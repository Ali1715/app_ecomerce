import 'package:application_ecommerce/models/models.dart';

abstract class RepositoryCarrito {
  /***********Carrito***************** */
  //getCarrito
  Future<List<Carritos>> getCarritos();
  //postCarrito
  Future<List<Carritos>> postCarritos(Carritos carritopost);
  //delCarrito
  Future<List<Carritos>> delCarritos(Carritos carritodel);
  //putdateCarrito
  Future<List<Carritos>> putCarritos(Carritos carritoput);
  //updateCarrito
  Future<List<Carritos>> upCarritos(Carritos carritoup);

  /********************************** */
}

abstract class RepositoryCliente {
  /***********Carrito***************** */
  //getCarrito
  Future<List<Clientes>> getClientes();
  //postCarrito
  Future<List<Clientes>> postClientes(Clientes Clientespost);
  //delCarrito
  Future<List<Clientes>> delClientes(Clientes Clientesdel);
  //putdateCarrito
  Future<List<Clientes>> putClientes(Clientes Clientesput);
  //updateCarrito
  Future<List<Clientes>> upClientes(Clientes Clientesup);

  /********************************** */

}
