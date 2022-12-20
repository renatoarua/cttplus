

import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:cttplus/models/via_cep.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:geocode/geocode.dart';
import 'package:search_cep/search_cep.dart';

class ViaCEPWidget extends StatefulWidget {
  // bool busy = false;
  // Widget child;

  const ViaCEPWidget({
    super.key,
    // required this.busy,
    // required this.child,
  });

  @override
  State<ViaCEPWidget> createState() => _ViaCEPWidgetState();
}

class _ViaCEPWidgetState extends State<ViaCEPWidget> {
  List<ViaCepModel> listaViaCep = [];
  bool nada = true;

  var teste = CPFValidator.isValid("334.616.710-02");

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildTextFild(context),
          Center(
            child: Observer(
              builder: (_) => nada
                  ? const Text('sem nada')
                  : ListView.builder(
                      itemCount: listaViaCep.length,
                      itemBuilder: (context, index) {
                        var endereco = listaViaCep[index];
                        return ListTile(
                          subtitle: Text(
                            'Bairro: ${endereco.bairro}',
                          ),
                          title: Text(
                            'Rua: ${endereco.logradouro}',
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextFild(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        autofocus: true,
        decoration: InputDecoration(
          labelStyle: TextStyle(
            color: Theme.of(context).primaryColorDark,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
          hintText: "Busque por Nome e CPF...",
          hintStyle: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 16,
            color: Theme.of(context).unselectedWidgetColor,
          ),
        ),
        // onSaved: (value) => {_message.title = value},
        onChanged: (value) async {
          if (value.length > 3) {
            nada = true;
            var list = await _searchByLogradouro(value);

            setState(() {
              listaViaCep = list;
              nada = false;
            });
          }
        },
        onFieldSubmitted: (value) {},
        validator: (value) {
          if (value! == '') return 'Informe um título';

          return null;
        },
      ),
    );
  }

  _searchByCep(String cep) async {
    final viaCepSearchCep = ViaCepSearchCep();
    final infoCepJSON = await viaCepSearchCep.searchInfoByCep(cep: cep);
    print(infoCepJSON);

    await _getLocalidadeFromAddress(
        'Rua Juiz Danilo Bertolin Précoma 348, São José dos Pinhais');
  }

  _searchByLogradouro(String logradouro) async {
    final viaCepSearchCep = ViaCepSearchCep();
    final cepsJSON = await viaCepSearchCep.searchForCeps(
        uf: 'PR',
        cidade: 'Sao Jose dos Pinhais',
        logradouro: logradouro,
        returnType: SearchCepsType.json);

    // var kk = cepsJSON.fold((_) => null, (data) => data);
    int index = 0;
    List<ViaCepModel> list = [];
    cepsJSON.forEach((r) {
      list.add(ViaCepModel(
          localidade: r[index].localidade.toString(),
          bairro: r[index].bairro.toString(),
          cep: r[index].cep.toString(),
          logradouro: r[index].logradouro.toString(),
          uf: r[index].uf.toString()));
      index++;
    });

    return list;
  }

  _getLocalidadeFromAddress(String address) async {
    GeoCode geoCode = GeoCode(apiKey: '578206913674759721118x113524 ');

    Coordinates coordinates = await geoCode.forwardGeocoding(address: address);

    print("Latitude: ${coordinates.latitude}");
    print("Longitude: ${coordinates.longitude}");
  }

  // Widget ssss(BuildContext context) async {
  //   return ListView.builder(
  //     itemCount: listaViaCep.length,
  //     itemBuilder: (context, index) {
  //       return ListTile(
  //         trailing: Container(
  //           width: 150,
  //           child: Row(
  //             // mainAxisAlignment: MainAxisAlignment.end,
  //             children: [
  //               IconButton(
  //                   // iconSize: 10,
  //                   onPressed: () {},
  //                   icon: const Icon(Icons.visibility)),
  //               IconButton(
  //                   // iconSize: 10,
  //                   onPressed: () {},
  //                   icon: const Icon(Icons.edit)),
  //               IconButton(
  //                   // iconSize: 10,
  //                   onPressed: () {},
  //                   icon: const Icon(Icons.delete)),
  //             ],
  //           ),
  //         ),
  //         subtitle: const Text('064.188.382.10'),
  //         title: const Text(
  //           'Renato',
  //           style: TextStyle(
  //             fontSize: 18,
  //           ),
  //         ),
  //       );
  //     },
  //   ).toList();
  // }
}
