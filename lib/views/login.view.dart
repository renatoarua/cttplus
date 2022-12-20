import 'package:flutter/material.dart';

import '../components/logo.component.dart';
import '../widgets/cttplus_busy.widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    var busy = false;

    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: SizedBox(
              width: 500,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: <Widget>[
                      const LogoComponent(width: 100),
                      CttPlusBusyWidget(
                        busy: busy,
                        child:
                            // TDButton(
                            //   text: "Login com o Google",
                            //   image: "assets/images/google.png",
                            //   callback: () {
                            //     handleSignIn();
                            //   },
                            // ),
                            Form(
                          // key: _formKey,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: <Widget>[
                                _buildTextFild(context),
                                _buildTextFild(context),
                                _buildButtonElevate(context),
                                _buildButtonText(context),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFild(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        autofocus: true,
        decoration: InputDecoration(
          labelText: "Título",
          labelStyle: TextStyle(
            color: Theme.of(context).primaryColorDark,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
          hintText: "Escreva seu título",
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

  Widget _buildButtonElevate(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, '/home'),
        child: const Text("login"),
      ),
    );
  }

  Widget _buildButtonText(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextButton(
        onPressed: () => Navigator.pushNamed(context, '/novo-usuario'),
        child: const Text("Clique aqui para cadastrar um novo usuário ;)"),
      ),
    );
  }

  _onSubmit() {
    return 1;
    // if (_formKey.currentState!.validate()) {
    //   _formKey.currentState!.save();
    //   _openWhatsApp();
    // }
  }
}
