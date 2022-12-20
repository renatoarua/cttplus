import '../models/usuario.model.dart';
import 'generico.repository.dart';

class UsuarioRepository
    extends GenericoRepository<List<UsuarioModel>> {
  UsuarioRepository() : super('usuarios');
}
