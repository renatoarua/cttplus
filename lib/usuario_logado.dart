class IUsuarioLogado {
  String id = '';
  String email = '';
  int senha = 0;
}

IUsuarioLogado usuarioLogado = IUsuarioLogado();

bool usuarioAutenticado() {
  const int maiorQue = 0;

  return usuarioLogado.id.length > maiorQue &&
      usuarioLogado.email.length > maiorQue &&
      usuarioLogado.senha > maiorQue;
}
