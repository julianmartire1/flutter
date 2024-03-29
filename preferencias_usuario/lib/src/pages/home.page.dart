import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/shared_prefs/preferenciasUsuarios.dart';
import 'package:preferencias_usuario/src/widgets/menu.widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final prefs = PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    prefs.ultimaPagina = HomePage.routeName;
    return Scaffold(
      appBar: AppBar(title: Text('Preferencias de Usuario'), backgroundColor: prefs.colorSecundario ? Colors.teal : Colors.blue,),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color secundario: ${prefs.colorSecundario}'),
          Divider(),
          Text('Genero: ${prefs.genero}'),
          Divider(),
          Text('Nombre usuario: ${prefs.nombreUsuario}'),
          Divider(),
        ],
      ),
    );
  }
}