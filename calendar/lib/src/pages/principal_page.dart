import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PrincipalPage extends StatefulWidget {
  @override
  _PrincipalPageState createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // padding: EdgeInsets.symmetric(horizontal: 5.0),
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            _fondoApp(context),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[_titulos(), _swiper(), _irReservas(context)],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _fondoApp(context) {
    final cajaVerde = Transform.rotate(
      angle: -pi / 1.0,
      child: Container(
        height: 400.0,
        width: MediaQuery.of(context).size.width - 10,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(13, 171, 97, 1.0),
            Color.fromRGBO(2, 145, 78, 1.0),
          ], end: Alignment.topCenter, begin: Alignment.bottomCenter),
          borderRadius: BorderRadius.circular(55.0),
        ),
      ),
    );

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: Stack(
        children: <Widget>[
          Positioned(
            child: cajaVerde,
            top: -90.0,
            // right: 5.0,
          )
        ],
      ),
    );
  }

  Widget _titulos() {
    return SafeArea(
      child: Container(
        padding:
            EdgeInsets.only(top: 30.0, bottom: 20.0, left: 30.0, right: 30.0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              StringUtils.capitalize(
                  DateFormat("EEEE d',' MMMM", 'es_AR').format(DateTime.now())),
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontFamily: 'Alata',
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              'Bienvenido!',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Alata'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _swiper() {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 30),
      height: 300.0,
      width: double.infinity,
      child: CarouselSlider(
        height: 250,
        items: [1, 2, 3, 4, 5].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(right: 15.0),
                child: Center(
                  child: Text(
                    'text $i',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[400],
                        spreadRadius: 2,
                        blurRadius: 6,
                        offset: Offset(0, 7), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0)),
              );
            },
          );
        }).toList(),
        enableInfiniteScroll: false,
      ),
    );
  }

  Widget _irReservas(context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        margin: EdgeInsets.symmetric(vertical: 15.0),
        child: Material(
          child: InkWell(
            borderRadius: BorderRadius.circular(20.0),
            onTap: () => Navigator.pushNamed(context, 'reservas'),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 15.0,
                ),
                Center(
                    child: Text(
                  'Ver todas las reservas',
                  style: TextStyle(
                      color: Color.fromRGBO(2, 145, 78, 1.0),
                      fontSize: 20.0,
                      fontFamily: 'Alata'),
                )),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
          color: Colors.transparent,
        ),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey[400],
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, 7),
          ),
        ], color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }
}
