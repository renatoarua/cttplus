import 'package:cttplus/models/usuario.model.dart';

import 'generico.repository.dart';

class LoginRepository extends GenericoRepository<UsuarioModel> {
  LoginRepository() : super('usuarioLogado');
}
