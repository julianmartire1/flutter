import 'package:ansicolor/ansicolor.dart';
import 'package:flutter/material.dart';
import 'package:hay_equipo/models/user.model.dart';
import 'package:hay_equipo/preferences/preferencias.dart';
import 'package:hay_equipo/services/auth.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    final prefs = PreferenciasUsuario();
    final UserModel user = userModelFromJson(prefs.user);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              signOutGoogle(context);
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Table(
              children: [
                
              ],
            )
            //_perfil(user)
          ],
        ),
      ),
    );
  }

  Widget _perfil(UserModel user) {
    return Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(100.0),
          child: Image(
            image: NetworkImage(user.picture),
            fit: BoxFit.cover,
            height: 150.0,
          ),
        ),
        SizedBox(height: 30.0),
        Text(
          user.name,
          style: TextStyle(fontSize: 30.0),
        )
      ],
    );
  }
}
