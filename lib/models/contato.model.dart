import 'dart:ffi';

class ContatoModel {
  String id = '';
  String nome = '';
  String telefone = '';
  String cpf = '';
  String idUsuario = '';

  String cep = '';
  String logradouro = '';
  String? complemento = '';
  String bairro = '';
  String localidade = '';
  String uf = '';
  String numeroResidencia = '';

  String idCordenada = '';
  double? latitude = 0;
  double? longitude = 0 ;
  bool retornouCordenada = false;

  ContatoModel({
    required this.id,
    required this.nome,
    required this.telefone,
    required this.cpf,
    required this.idUsuario,
    required this.cep,
    required this.logradouro,
    this.complemento = '',
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.numeroResidencia,
    required this.idCordenada,
    required this.latitude,
    required this.longitude,
    required this.retornouCordenada,
  });

  ContatoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    telefone = json['telefone'];
    cpf = json['cpf'];
    idUsuario = json['idUsuario'];

    cep = json['cep'];
    logradouro = json['logradouro'];
    complemento = json['complemento'];
    bairro = json['bairro'];
    localidade = json['localidade'];
    uf = json['uf'];
    numeroResidencia = json['numeroResidencia'];

    idCordenada = json['idCordenada'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    retornouCordenada = json['retornouCordenada'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['nome'] = nome;
    data['telefone'] = telefone;
    data['cpf'] = cpf;
    data['idUsuario'] = idUsuario;

    data['cep'] = cep;
    data['logradouro'] = logradouro;
    data['complemento'] = complemento;
    data['bairro'] = bairro;
    data['localidade'] = localidade;
    data['uf'] = uf;
    data['numeroResidencia'] = numeroResidencia;

    data['idCordenada'] = idCordenada;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['retornouCordenada'] = retornouCordenada;

    return data;
  }

  bool temValor() {
    const int maiorQue = 0;
    return id.length > maiorQue && nome.length > maiorQue && telefone.length > maiorQue;
  }
}
