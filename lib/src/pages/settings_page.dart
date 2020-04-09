import 'package:flutter/material.dart';

import 'package:userapppreferences/src/share_prefs/preferencias_usuario.dart';

import 'package:userapppreferences/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario;
  int _genero;
  String _nombre;

  TextEditingController _textController;
  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    super.initState();

    prefs.ultimaPagina = SettingsPage.routeName;

    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _nombre = prefs.nombre;

    _textController = new TextEditingController(text: _nombre);
  }

  setSelectedRadio(int value) {
    _genero = value;
    prefs.genero = _genero;
    setState(() {});
  }

  setColor(bool value) {
    _colorSecundario = value;
    prefs.colorSecundario = _colorSecundario;
    setState(() {});
  }

  setNombre(String value) {
    // _nombre = value;
    prefs.nombre = value;
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        backgroundColor: prefs.colorSecundario ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            child: Text(
              'Settings',
              style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
            ),
            padding: EdgeInsets.all(5.0),
          ),
          Divider(),
          SwitchListTile(
            title: Text('Color Secundario'),
            onChanged: setColor,
            value: _colorSecundario,
          ),
          RadioListTile(
            value: 1,
            title: Text('Masculino'),
            groupValue: _genero,
            onChanged: setSelectedRadio,
          ),
          RadioListTile(
            value: 2,
            title: Text('Femenino'),
            groupValue: _genero,
            onChanged: setSelectedRadio,
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                  labelText: 'Nombre', helperText: 'Nombre de la persona'),
              onChanged: setNombre,
            ),
          )
        ],
      ),
    );
  }
}
