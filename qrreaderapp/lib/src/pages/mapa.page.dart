import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:qrreaderapp/src/models/scan.model.dart';

class MapaPage extends StatefulWidget {
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  MapController mapController = MapController();
  String tipoMapa = 'streets';

  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Coordenadas QR'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: () {
              mapController.move(scan.getLatLng(), 15);
            },
          )
        ],
      ),
      body: _crearMap(scan),
      floatingActionButton: _crearBotonFlotante(context),
    );
  }

  Widget _crearMap(ScanModel scan) {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(center: scan.getLatLng(), zoom: 10),
      layers: [_crearMapa(), _crearMarcadores(scan)],
    );
  }

  _crearMapa() {
    return TileLayerOptions(
        urlTemplate: 'https://api.mapbox.com/v4/'
            '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
        additionalOptions: {
          'accessToken':
              'pk.eyJ1IjoianVsaWFubWFydGlyZTEiLCJhIjoiY2sxdGZqdzBtMDF3YzNib2piem5qYW92OCJ9.qm2xoNNVFZuGH228JZXkxg',
          'id': 'mapbox.$tipoMapa'
          //streets,dark,light,outdoors,satellite
        });
  }

  _crearMarcadores(ScanModel scan) {
    return MarkerLayerOptions(markers: <Marker>[
      Marker(
          width: 100.0,
          height: 100.0,
          point: scan.getLatLng(),
          builder: (context) => Container(
                child: Icon(
                  Icons.location_on,
                  size: 70.0,
                  color: Theme.of(context).primaryColor,
                ),
              ))
    ]);
  }

  Widget _crearBotonFlotante(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        //streets,dark,light,outdoors,satellite
        if (tipoMapa == 'streets') {
          tipoMapa = 'dark';
        } else if (tipoMapa == 'dark') {
          tipoMapa = 'light';
        } else if (tipoMapa == 'light') {
          tipoMapa = 'outdoors';
        } else if (tipoMapa == 'outdoors') {
          tipoMapa = 'satellite';
        } else if (tipoMapa == 'satellite') {
          tipoMapa = 'streets';
        }

        setState(() {});
      },
      backgroundColor: Theme.of(context).primaryColor,
      child: Icon(Icons.repeat),
    );
  }
}
