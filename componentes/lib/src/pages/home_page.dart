// import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/providers/menu.provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    // menuProvider.cargarData();
    return FutureBuilder(
        future: menuProvider.cargarData(),
        initialData: [],
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          return ListView(
            children: _listaItems(snapshot.data, context),
          );
        });
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];
    data.forEach((op) {
      final widgetTemp = ListTile(
        title: Text(op['texto']),
        leading: getIcon(op['icon']),
        trailing: getIcon('keyboard_arrow_right'),
        onTap: () {
          Navigator.pushNamed(context, op['ruta']);

          /* final route = MaterialPageRoute(builder: (context) => AlertPage());
          Navigator.push(context, route); */
        },
      );
      opciones..add(widgetTemp)..add(Divider());
    });

    return opciones;
  }
}
