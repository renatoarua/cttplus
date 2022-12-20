class UsuarioModel {
  String id = '';
  String email = '';
  int senha = 0;

  UsuarioModel({
    required this.id,
    required this.email,
    required this.senha,
  });

  UsuarioModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    senha = json['senha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['senha'] = senha;
    return data;
  }

  bool temValor() {
    const int maiorQue = 0;
    return id.length > maiorQue && email.length > maiorQue && senha > maiorQue;
  }
}
