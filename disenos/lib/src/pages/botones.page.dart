import 'dart:math';
import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';

class BotonesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _fondoApp(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[_titulos(), _botones()],
            ),
          )
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Widget _fondoApp() {
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color.fromRGBO(52, 54, 101, 1.0),
          Color.fromRGBO(37, 37, 57, 1.0),
        ],
        begin: FractionalOffset(0.0, 0.6),
        end: FractionalOffset(0.0, 1.0),
      )),
    );

    final cajaRosa = Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
        height: 360.0,
        width: 360.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(236, 98, 188, 1.0),
              Color.fromRGBO(241, 142, 172, 1.0),
            ],
          ),
          borderRadius: BorderRadius.circular(80.0),
        ),
      ),
    );

    return Stack(
      children: <Widget>[
        gradiente,
        Positioned(
          child: cajaRosa,
          top: -100.0,
        )
      ],
    );
  }

  Widget _titulos() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Classify transaction',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Classify this transaction into a particular category',
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(55, 57, 84, 1.0),
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Color.fromRGBO(116, 117, 152, 1.0),
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today,
                size: 30.0,
              ),
              title: Container()),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.bubble_chart,
                size: 30.0,
              ),
              title: Container()),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.supervised_user_circle,
                size: 30.0,
              ),
              title: Container())
        ],
      ),
    );
  }

  Widget _botones() {
    return Table(
      children: [
        TableRow(children: [
          _crearBotonRedondeado(Colors.blue, Icons.border_all, 'General'),
          _crearBotonRedondeado(Colors.purpleAccent, Icons.directions_bus, 'Bus'),
        ]),
        TableRow(children: [
          _crearBotonRedondeado(Colors.pinkAccent, Icons.shop, 'Buy'),
          _crearBotonRedondeado(Colors.orange, Icons.insert_drive_file, 'File'),
        ]),
        TableRow(children: [
          _crearBotonRedondeado(Colors.blueAccent, Icons.movie_filter, 'Entertaiment'),
          _crearBotonRedondeado(Colors.green, Icons.cloud, 'Grocery'),
        ]),
        TableRow(children: [
          _crearBotonRedondeado(Colors.red, Icons.collections, 'Photos'),
          _crearBotonRedondeado(Colors.teal, Icons.help_outline, 'Help'),
        ])
      ],
    );
  }

  Widget _crearBotonRedondeado(Color color, IconData icono, String texto) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: prefix0.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: 180.0,
            decoration: BoxDecoration(
              color: Color.fromRGBO(62, 66, 107, 0.7),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CircleAvatar(
                  radius: 35.0,
                  backgroundColor: color,
                  child: Icon(
                    icono,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
                Text(texto, style: TextStyle(color: color, fontSize: 20.0)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
