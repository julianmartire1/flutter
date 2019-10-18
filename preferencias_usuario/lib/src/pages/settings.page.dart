import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/shared_prefs/preferenciasUsuarios.dart';
import 'package:preferencias_usuario/src/widgets/menu.widget.dart';

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

  final pref = PreferenciasUsuario();

  @override
  void initState() {
    super.initState();
    _genero = pref.genero;
    _colorSecundario = pref.colorSecundario;
    _nombre = pref.nombreUsuario;
    pref.ultimaPagina = SettingsPage.routeName;
    _textController = TextEditingController(text: _nombre);
  }

  _setSelectedRadio(int value) {
    pref.genero = value;
    _genero = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ajustes'), backgroundColor: pref.colorSecundario ? Colors.teal : Colors.blue),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Settings', style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold,)),
          ),
          Divider(),
          SwitchListTile(
            value: _colorSecundario,
            title: Text('Color Secundario'),
            onChanged: (value) {
              setState(() {
                _colorSecundario = value;
                pref.colorSecundario = value;
              });
            },
          ),
          Divider(),
          RadioListTile(
            value: 1,
            title: Text('Masculino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
          RadioListTile(
            value: 2,
            title: Text('Femenino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(labelText: 'Nombre', helperText: 'Nombre de la persona', ),
              onChanged: (String value) {
                pref.nombreUsuario = value;
              },
            ),
          )
        ],
      )
    );
  }
}