import 'package:cttplus/models/via_cep.model.dart';

import '../services/via_cep.service.dart';

class ViaCepController {
  late ViaCepService _viaCepService;

  // passar os stores
  ViaCepController() {
    _viaCepService = ViaCepService();

    // instanciar os stores
  }

  Future<ViaCepModel> obterEnderecoPorCep(String cep) async {
    return await _viaCepService.obterEnderecoPeloCEP(cep);
  }

  Future obterListaEnderecoPeloLogradouro(
    String uf,
    String cidade,
    String logradouro,
  ) async {
    var listaEndereco =  await _viaCepService.obterListaEnderecoPeloLogradouro(
      uf,
      cidade,
      logradouro,
    );

    // setar no store a listaEndereco
  }
}
