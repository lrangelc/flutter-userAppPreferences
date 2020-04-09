import 'package:flutter/material.dart';
import 'package:userapppreferences/src/share_prefs/preferencias_usuario.dart';

import 'package:userapppreferences/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final prefs = PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    prefs.ultimaPagina = HomePage.routeName;

    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de Usuarios'),
        backgroundColor: prefs.colorSecundario ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color Secundario: ${prefs.colorSecundario}'),
          Divider(),
          Text('Genero: ${(prefs.genero == 1 ? 'Masculino' : 'Femenino')}'),
          Divider(),
          Text('Nombre de usuario: ${prefs.nombre}'),
          Divider(),
        ],
      ),
    );
  }
}
