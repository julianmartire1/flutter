import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hay_equipo/pages/home_page.dart';
import 'package:hay_equipo/preferences/preferencias.dart';
import 'package:hay_equipo/utils/utils.dart' as utils;

import 'pages/login_page.dart';

final prefs = PreferenciasUsuario();

void main() async {
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // print("TOKEN: ${prefs.token}");
    
    // print(utils.obtenerHoras());

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: prefs.token.isEmpty ? LoginPage.routeName : HomePage.routeName,
      // initialRoute: LoginPage.routeName,
      routes: {
        LoginPage.routeName: (BuildContext context) => LoginPage(),
        HomePage.routeName: (BuildContext context) => HomePage(),
      },
    );
  }
}
// TRABAJO 92:c5:de:44:36:f7:36:c5:13:6e:5b:4f:92:ac:b0:a1:a2:36:f2:ab
// CASA