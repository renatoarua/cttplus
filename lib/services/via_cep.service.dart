import 'package:cttplus/models/via_cep.model.dart';
import 'package:search_cep/search_cep.dart';

class ViaCepService {
  Future<ViaCepModel> obterEnderecoPeloCEP(String cep) async {
    final service = ViaCepSearchCep();
    final response = await service.searchInfoByCep(cep: cep);

    var data = response.fold((_) => null, (data) => data);
    return data as Future<ViaCepModel>;
  }

  Future<List<ViaCepModel>> obterListaEnderecoPeloLogradouro(
    String uf,
    String cidade,
    String logradouro,
  ) async {
    final service = ViaCepSearchCep();
    final response = await service.searchForCeps(
        uf: uf,
        cidade: cidade,
        logradouro: logradouro,
        returnType: SearchCepsType.json);

    var data = response.fold((_) => null, (data) => data);
    return data as Future<List<ViaCepModel>>;
  }
}
