import 'package:flutter/material.dart';

import '../components/logo.component.dart';
import '../widgets/via_cep.widget.dart';
import 'map.view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

// stores ExpansionPanel state information
class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}

class _HomeViewState extends State<HomeView> {
  final List<Item> _data = generateItems(30);

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    var busy = false;

    return Scaffold(
      key: scaffoldKey,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SizedBox(
            child: Row(
              children: [
                Card(
                  child: SizedBox(
                    width: 400,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          const LogoComponent(width: 70),
                          Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('renato@gmail.com'),
                                IconButton(
                                  icon: const Icon(Icons.more_vert_outlined),
                                  tooltip: 'Deletar Mensagem',
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            child: const Divider(
                              thickness: 0,
                              height: 5,
                            ),
                          ),
                          const ViaCEPWidget(),
                          Row(
                            children: [
                              Expanded(child: _buildTextFild(context)),
                              IconButton(
                                icon: const Icon(Icons.search_rounded),
                                onPressed: () {},
                              ),
                            ],
                          ),
                          Flexible(
                            child: ListView.builder(
                              itemCount: _data.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  trailing: Container(
                                    width: 150,
                                    child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                            // iconSize: 10,
                                            onPressed: () {},
                                            icon: const Icon(Icons.visibility)),
                                        IconButton(
                                            // iconSize: 10,
                                            onPressed: () {},
                                            icon: const Icon(Icons.edit)),
                                        IconButton(
                                            // iconSize: 10,
                                            onPressed: () {},
                                            icon: const Icon(Icons.delete)),
                                      ],
                                    ),
                                  ),
                                  subtitle: const Text('064.188.382.10'),
                                  title: const Text(
                                    'Renato',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Expanded(
                  child: Card(
                    child: MapView(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>(
        (Item item) {
          return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Expanded(
                child: Container(
                  height: 100,
                  child: ListTile(
                    title: Text(item.headerValue),
                  ),
                ),
              );
            },
            body: ListTile(
              title: Text(item.expandedValue),
              subtitle:
                  const Text('To delete this panel, tap the trash can icon'),
              trailing: const Icon(Icons.delete),
              onTap: () {
                setState(
                  () {
                    _data
                        .removeWhere((Item currentItem) => item == currentItem);
                  },
                );
              },
            ),
            isExpanded: item.isExpanded,
          );
        },
      ).toList(),
    );
  }

  Widget _buildListTile(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: Colors.grey),
        ),
        color: Colors.white,
      ),
      child: const ListTile(
        title: Text(
          'sdasdfsdfsdf',
          style: TextStyle(
              // fontSize: 18,
              // color: todo.done ? Colors.black.withOpacity(.2) : Colors.black,
              ),
        ),
        subtitle: Text('asdgayjsgdjygasdj'),

        // onLongPress: () {
        //   showDialog(
        //     context: context,
        //     builder: (BuildContext context) {
        //       return AlertDialog(
        //         title: Text("Concluir a Tarefa"),
        //         content: Text("Deseja concluir a tarefa ${todo.title}?"),
        //         actions: <Widget>[
        //           FlatButton(
        //             child: new Text("Cancelar"),
        //             onPressed: () {
        //               Navigator.of(context).pop();
        //             },
        //           ),
        //           FlatButton(
        //             child: new Text(
        //               "Concluir",
        //               style: TextStyle(color: Colors.green),
        //             ),
        //             onPressed: () {
        //               controller.markAsDone(todo).then((value) {
        //                 Navigator.of(context).pop();
        //               }).catchError((err) {
        //                 var snackbar = new SnackBar(
        //                   content: Text("ops, algo de errado!"),
        //                 );
        //                 Scaffold.of(context).showSnackBar(snackbar);
        //               });
        //             },
        //           ),
        //         ],
        //       );
        //     },
        //   );
        // },
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
        onFieldSubmitted: (value) {},
        validator: (value) {
          if (value! == '') return 'Informe um título';

          return null;
        },
      ),
    );
  }
}
