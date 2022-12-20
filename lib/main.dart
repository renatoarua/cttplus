import 'package:flutter/material.dart';

import 'views/home.view.dart';
import 'views/login.view.dart';
import 'views/novo_usuario.vew.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Rotas.login,
      routes: {
        Rotas.login: (context) => const LoginView(),
        Rotas.novoUsuario: (context) => const NovoUsuarioView(),
        Rotas.home: (context) => const HomeView(),
      },
      title: 'ctt+',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class Rotas {
   static const String login = '/login';
   static const String novoUsuario = '/novo-usuario';
   static const String home = '/home';
}