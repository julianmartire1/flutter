import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/pages/home.page.dart';
import 'package:preferencias_usuario/src/pages/settings.page.dart';
import 'package:preferencias_usuario/src/shared_prefs/preferenciasUsuarios.dart';

void main() async{
  final prefs = PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final prefs = PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferencias',
      initialRoute: prefs.ultimaPagina,
      routes: {
        HomePage.routeName: (BuildContext context) => HomePage(),
        SettingsPage.routeName: (BuildContext context) => SettingsPage(),
      },
    );
  }
}
