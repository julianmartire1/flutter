import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/pages/home.page.dart';
import 'package:preferencias_usuario/src/pages/settings.page.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/menu-img.jpg'), fit: BoxFit.cover)
            ),
          ),
          ListTile(
            leading: Icon(Icons.pages, color: Colors.blue,),
            title: Text('Pages'),
            onTap: () => Navigator.pushReplacementNamed(context, HomePage.routeName),
          ),
          ListTile(
            leading: Icon(Icons.party_mode, color: Colors.blue,),
            title: Text('Party Mode'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.people, color: Colors.blue,),
            title: Text('People'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.blue,),
            title: Text('Settings'),
            onTap: () {
              Navigator.pushReplacementNamed(context, SettingsPage.routeName);
            },
          )
        ],
      ),
    );
  }
}