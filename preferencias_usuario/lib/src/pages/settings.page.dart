import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/widgets/menu.widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario = false;
  int _genero = 1;
  String _nombre = 'Pepe';

  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _cargarPref();
    _textController = TextEditingController(text: _nombre);
  }

  _cargarPref() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    _genero = pref.getInt('genero');
    setState(() {});
  }

  _setSelectedRadio(int value) async{
    _genero = value;
    setState(() {});

    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('genero', value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ajustes'),),
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
              onChanged: (String value) {},
            ),
          )
        ],
      )
    );
  }
}