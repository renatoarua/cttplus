import '../models/contato.model.dart';
import '../repositories/contato.repository.dart';
import '../services/geo_code.service.dart';
import '../usuario_logado.dart';
import '../uteis/ordenacao.utiul.dart';

class ContatoController extends OrdenacaoUtiul<ContatoModel> {
  late ContatoRepository _contatoReepository;
  late GeoCodeService _geoCodeService;

  // passar os stores
  ContatoController() {
    _contatoReepository = ContatoRepository();
    _geoCodeService = GeoCodeService();

    // instanciar os stores
  }

  Future criarContato(ContatoModel contato) async {
    // obter todos os contatos do usuario
    var contatos = await _obter();

    // adicionar o contato na lista
    contatos.add(contato);

    // busca as cordenadas para salvar
    _obterCordenadas(contato);

    // setar na lista store

    // salvar nova lista
    await _salvar(contatos);
  }

  Future excluirContato(ContatoModel contato) async {
    // obter todos os contatos do usuario
    var contatos = await _obter();

    // remove o contato em questao
    contatos.remove(contato);

    // setar na lista store

    // salvar nova lista
    await _salvar(contatos);
  }

  Future<List<ContatoModel>> obterContatosUsuario() async {
    // obter todos os contatos do usuario
    var contatos = await _obter();

    // filtrar apenas os contatos com o idUsuario logado
    var contatosUsuario = _filtrarContatosUsuario(contatos);

    // reordenar a lista
    contatosUsuario = ordernarListaAlphanumerica(
      contatosUsuario,
      OrdenacaoUtiul.alphanumericoCrescente,
      OrdenacaoUtiul.campoNome,
    );

    // setar a lista de store

    return contatosUsuario;
  }

  Future editarContato(ContatoModel contato) async {
    // obter todos os contatos do usuario
    var contatos = await _obter();

    // obter o contato antigo
    var contatoAntigo = contatos.firstWhere((c) => c.id == contato.id);

    // remove o contato da lista storage
    contatos.remove(contatoAntigo);

    // seta na lista sotorage o novo contato
    contatos.add(contato);

    // salva a lista
    _salvar(contatos);

    // remover da lista store

    // salva novo contato
  }

  Future<bool> cpfDisponivel(String cpf) async {
    // obter todos os contatos do usuario
    var contatos = await _obter();

    // retorna lista de contatos com o cpf em questao
    return contatos.where((c) => c.cpf == cpf).toList().isEmpty;
  }

  Future _salvar(List<ContatoModel> contatos) async {
    await _contatoReepository.salvar(contatos);
  }

  Future<List<ContatoModel>> _obter() async {
    // obter todos os contatos
    var contatos = await _contatoReepository.obter();

    // filtrar os contatos pelo idUsuario
    return _filtrarContatosUsuario(contatos);
  }

  List<ContatoModel> _filtrarContatosUsuario(
    List<ContatoModel> contatos,
  ) {
    // filtrar apenas os contatos com o idUsuario logado
    return contatos.where((c) => c.idUsuario == usuarioLogado.id).toList();
  }

  _obterCordenadas(ContatoModel contato) {
    _geoCodeService
        .obterCordenadaPeloEndereco(
      contato.logradouro,
      contato.numeroResidencia,
      contato.localidade,
    )
        .then((cordenadas) {
      // verifica os dados
      // estou fazendo dessa forma, pq a api que estou consumindo, está demorando muito para retornar os dados
      if (cordenadas.latitude == null && cordenadas.latitude == null) return;

      // atualizar objeto
      contato.latitude = cordenadas.latitude;
      contato.longitude = cordenadas.longitude;
      contato.retornouCordenada = true;

      // setar cordenadas na lista endereco store

      // atualizar objeto salvo
      editarContato(contato);
    });
  }
}
