import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qrreaderapp/src/bloc/scans.bloc.dart';
import 'package:qrreaderapp/src/models/scan.model.dart';
import 'package:qrreaderapp/src/pages/direcciones.page.dart';
import 'package:qrreaderapp/src/pages/mapas.page.dart';

import 'package:qrcode_reader/qrcode_reader.dart';
import 'package:qrreaderapp/src/utils/utils.dart' as utils;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scansBloc = ScansBloc();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () => scansBloc.borrarTodosScans(),
          )
        ],
      ),
      body: _callPage(currentIndex),
      bottomNavigationBar: _crearBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_center_focus),
        onPressed: () => _scanQR(context),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  _scanQR(context) async {    
    //geo:40.700291257425135,-73.97572889765627

    //String futureString = '';
    String futureString = 'https://google.com';
    /* try {
      futureString = await QRCodeReader().scan();
    } catch (e) {
      print(e);
      futureString = e.toString();
    }

    if(futureString != null)
      print('futureString: $futureString'); */

    if(futureString != null) {
      final scan = ScanModel(valor: futureString);
      scansBloc.agregarScan(scan);

      final scan2 = ScanModel(valor: 'geo:40.700291257425135,-73.97572889765627');
      scansBloc.agregarScan(scan2);

      if(Platform.isIOS) {
        Future.delayed(Duration(milliseconds: 750), () {
          utils.abrirScan(scan, context);  
        });
      } else utils.abrirScan(scan, context);

      //utils.abrirScan(scan);
    }
  }

  Widget _callPage(int paginaActual) {
    switch (paginaActual) {
      case 0: return MapasPage();
      case 1: return DireccionesPage();
      default: return MapasPage();
    }
  }

  Widget _crearBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (i) {
        setState(() {
          currentIndex = i;
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.map), title: Text('Mapas')),
        BottomNavigationBarItem(
            icon: Icon(Icons.brightness_5), title: Text('Direcciones'))
      ],
    );
  }
}
