import 'package:flutter/material.dart';
import 'package:qrreaderapp/src/pages/direcciones.page.dart';
import 'package:qrreaderapp/src/pages/mapas.page.dart';

import 'package:qrcode_reader/qrcode_reader.dart';
import 'package:qrreaderapp/src/providers/db.provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {},
          )
        ],
      ),
      body: _callPage(currentIndex),
      bottomNavigationBar: _crearBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_center_focus),
        onPressed: _scanQR,
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  _scanQR() async {    
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
      DBProvider.db.nuevoScan(scan);
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
