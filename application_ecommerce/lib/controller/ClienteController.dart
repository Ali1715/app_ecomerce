import 'package:application_ecommerce/repository/Repository.dart';
import 'package:application_ecommerce/models/models.dart';
import 'package:application_ecommerce/models/mysql.dart';

class ClienteController {
  final RepositoryCliente RepClientes;
  ClienteController(this.RepClientes);

  //get
  Future<List<Clientes>> fetchClientesList() async {
    return RepClientes.getClientes();
  }
  //post

}
