import 'package:flutter/material.dart';
import 'package:table_calendar_example/src/models/ReservaModel.dart';
import 'package:table_calendar_example/src/utils/utils.dart' as utils;
import 'package:intl/intl.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<utils.Horas> _horasGrilla;
  Color colorCard;
  @override
  void initState() {
    super.initState();
    _horasGrilla = utils.obtenerHoras();
    // print(utils.obtenerHoras());
  }

  @override
  Widget build(BuildContext context) {
    colorCard = Colors.green[700];

    return Scaffold(
        appBar: AppBar(
          title: Text('Second Page'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              _agregarHoras(context),
              Expanded(child: _agregarAlquilados(context))
            ],
          ),
        ));
  }

  Widget _agregarHoras(BuildContext context) {
    return Column(
      children: _horasGrilla.map((hora) {
        return Container(
          height: 80.0,
          width: MediaQuery.of(context).size.width * 0.30,
          padding:
              EdgeInsets.only(bottom: 40.0, left: 30.0, right: 30.0, top: 5.0),
          decoration:
              BoxDecoration(border: Border(
                right: BorderSide(color: Colors.grey, width: 1.0),
                top: BorderSide(color: Colors.grey, width: 1.0),
                bottom: BorderSide(color: Colors.grey, width: 1.0)
              )),
          child: Text(
            hora.hora,
            style: TextStyle(color: Colors.grey, fontSize: 20.0),
          ),
          alignment: Alignment(0.0, -1.0),
        );
      }).toList(),
    );
  }

  Widget _agregarAlquilados(BuildContext context) {
    List<ReservaModel> alquilado = [
      ReservaModel(
          horarioDesdeNum: 1,
          horarioHastaNum: 3,
          horarioDesde: DateTime(2019, 11, 8, 0, 30),
          horarioHasta: DateTime(2019, 11, 8, 2, 00),
          nombreUser: 'Jorge Lopez'),
      ReservaModel(
          horarioDesdeNum: 4,
          horarioHastaNum: 5,
          horarioDesde: DateTime(2019, 11, 8, 2, 0),
          horarioHasta: DateTime(2019, 11, 8, 3, 0),
          nombreUser: 'Martin Lutero'),
    ];

    bool pintar = false;
    int i = 0;
    return Column(
      children: _horasGrilla.map((hora) {
        Widget contenedor;
        ReservaModel reserva = alquilado[i];

        if (reserva.horarioDesdeNum == hora.numero) {
          pintar = true;
          contenedor = _pintarDesde(context, reserva);
        } else if (reserva.horarioHastaNum == (hora.numero)) {
          pintar = false;
          i += ((i + 1) != alquilado.length) ? 1 : 0;
          contenedor = _pintarHasta(context);
        } else if (pintar) {
          contenedor = _pintarIntermedio(context);
        } else {
          contenedor = _pintarNulo(context);
        }

        return contenedor;
      }).toList(),
    );
  }

  Container _pintarNulo(BuildContext context) {
    return Container(
      height: 80.0,
      width: MediaQuery.of(context).size.width * 0.70,
      decoration:
          //BoxDecoration(border: Border.all(color: Colors.grey, width: 1.0)),
          BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1.0, color: Colors.grey),
                  left: BorderSide(width: 1.0, color: Colors.grey),
                  top: BorderSide(width: 1.0, color: Colors.grey))),
    );
  }

  Container _pintarIntermedio(BuildContext context) {
    return Container(
      height: 80.0,
      width: MediaQuery.of(context).size.width * 0.70,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(color: colorCard),
      ),
      decoration: BoxDecoration(
          border: Border(
        left: BorderSide(width: 1.0, color: Colors.grey),
      )),
    );
  }

  Container _pintarHasta(BuildContext context) {
    return Container(
      height: 80.0,
      width: MediaQuery.of(context).size.width * 0.70,
      child: Container(
        margin: EdgeInsets.only(bottom: 5.0, left: 20.0, right: 20.0),
        decoration: BoxDecoration(
            color: colorCard,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25.0))),
      ),
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(width: 1.0, color: Colors.grey),
        left: BorderSide(width: 1.0, color: Colors.grey),
      )),
    );
  }

  Container _pintarDesde(BuildContext context, ReservaModel reserva) {
    DateFormat dateFormat = DateFormat("HH:mm");
    TextStyle textStyleHora = TextStyle(
        color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold);
    TextStyle textStyleNombre = TextStyle(
        color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold);

    return Container(
      height: 80.0,
      width: MediaQuery.of(context).size.width * 0.70,
      decoration: BoxDecoration(
          border: Border(
        top: BorderSide(width: 1.0, color: Colors.grey),
        left: BorderSide(width: 1.0, color: Colors.grey),
      )),
      child: Container(
        margin: EdgeInsets.only(top: 5.0, left: 20.0, right: 20.0),
        decoration: BoxDecoration(
            color: colorCard,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0))),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          alignment: Alignment(-1.0, -1.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "${dateFormat.format(reserva.horarioDesde)} - ${dateFormat.format(reserva.horarioHasta)}",
                style: textStyleHora,
              ),
              Text(
                "${reserva.nombreUser}",
                style: textStyleNombre,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ),
    );
  }
}
