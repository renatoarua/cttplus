import 'package:flutter/material.dart';

import '../models/usuario.model.dart';
import '../repositories/login.repository.dart';
import '../repositories/usuario.repository.dart';
import '../usuario_logado.dart';

class LoginController {
  late UsuarioRepository _usuarioReepository;
  late LoginRepository _loginRepository;
  late BuildContext _context;

  LoginController(BuildContext context) {
    _usuarioReepository = UsuarioRepository();
    _loginRepository = LoginRepository();
    _context = context;
  }

  Future<bool> login(String email, int senha) async {
    // obter todos os usuarios
    var usuarios = await _usuarioReepository.obter();

    // achar o usuario com o email e senha
    var listaUsuarios = usuarios.where((u) => u.email == email && u.senha == senha).toList();

    // verificar se tem usuario com o email e senha em questao
    if (listaUsuarios.isEmpty) return false;

    // popular objeto UsuarioLogado
    usuarioLogado.id = listaUsuarios[0].id;
    usuarioLogado.email = listaUsuarios[0].email;
    usuarioLogado.senha = listaUsuarios[0].senha;

    return true;
  }

  Future logout() async {
    // remover usuarioLogado do storage
    await _loginRepository.remover();

    // setar novo Objeto Global UsuarioLogado
    usuarioLogado = IUsuarioLogado();
  }
}
