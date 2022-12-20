import 'package:cttplus/models/usuario.model.dart';

import '../repositories/usuario.repository.dart';

class UsuarioController {
  late UsuarioRepository _usuarioReepository;

  // passar os stores
  UsuarioController() {
    _usuarioReepository = UsuarioRepository();

    // instanciar os stores
  }

  Future criarConta(UsuarioModel usuario) async {
    // obter todos usuarios do storage
    var usuarios = await _obter();

    // adiciona o usuario em questao
    usuarios.add(usuario);

    // salva a lista no sotorage
    await _salvar(usuarios);
  }

  Future excluirConta(UsuarioModel usuario) async {
    // obtem todos os usuarios
    var usuarios = await _obter();

    // remove o usuario em questao
    usuarios.remove(usuario);

    // salva a lista no storage
    _salvar(usuarios);
  }

  Future<bool> emailDisponivel(String email) async {
    // obtem todos usuarios
    var usuarios = await _obter();

    // filtra os usuarios pelo email
    var usuariosFiltrado = usuarios.where((u) => u.email == email).toList();

    // retorna true se a lista estiver empty. email valido
    return usuariosFiltrado.isEmpty;
  }

  Future _salvar(List<UsuarioModel> usuarios) async {
    await _usuarioReepository.salvar(usuarios);
  }

  Future<List<UsuarioModel>> _obter() async {
    return await _usuarioReepository.obter();
  }
}
