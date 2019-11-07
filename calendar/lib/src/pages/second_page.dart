import 'package:flutter/material.dart';
import 'package:table_calendar_example/src/models/ReservaModel.dart';
import 'package:table_calendar_example/src/utils/utils.dart' as utils;

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<utils.Horas> _horasGrilla;

  @override
  void initState() {
    super.initState();
    _horasGrilla = utils.obtenerHoras();
    // print(utils.obtenerHoras());
  }

  @override
  Widget build(BuildContext context) {
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
              BoxDecoration(border: Border.all(color: Colors.grey, width: 1.0)),
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
      ReservaModel(horarioDesdeNum: 1, horarioHastaNum: 3),
      ReservaModel(horarioDesdeNum: 4, horarioHastaNum: 5),
      ReservaModel(horarioDesdeNum: 6, horarioHastaNum: 7),
      ReservaModel(horarioDesdeNum: 15, horarioHastaNum: 16),
      ReservaModel(horarioDesdeNum: 47, horarioHastaNum: 48)
    ];

    bool pintar = false;
    int i = 0;
    return Column(
      children: _horasGrilla.map((hora) {
        Widget contenedor;
        ReservaModel reserva = alquilado[i];
        if (reserva.horarioDesdeNum == hora.numero) {
          // print("DESDE: ${reserva.horarioDesdeNum} == ${hora.numero}");
          pintar = true;
          contenedor = Container(
            height: 80.0,
            width: MediaQuery.of(context).size.width * 0.70,
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(width: 1.0, color: Colors.grey),
              left: BorderSide(width: 1.0, color: Colors.grey),
              right: BorderSide(width: 1.0, color: Colors.grey),
            )),
            child: Container(
              margin: EdgeInsets.only(top: 5.0, left: 20.0, right: 20.0),
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      topRight: Radius.circular(5.0))),
            ),
          );
        } else if (reserva.horarioHastaNum == (hora.numero)) {
          // print("HASTA: ${reserva.horarioDesdeNum} == ${hora.numero}");
          pintar = false;
          i += ((i + 1) != alquilado.length) ? 1 : 0;
          contenedor = Container(
            height: 80.0,
            width: MediaQuery.of(context).size.width * 0.70,
            child: Container(
              margin: EdgeInsets.only(bottom: 5.0, left: 20.0, right: 20.0),
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5.0),
                      bottomRight: Radius.circular(5.0))),
            ),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(width: 1.0, color: Colors.grey),
              left: BorderSide(width: 1.0, color: Colors.grey),
              right: BorderSide(width: 1.0, color: Colors.grey),
            )),
          );
        } else if (pintar) {
          // print("PINTAR: ${reserva.horarioDesdeNum} == ${hora.numero}");
          contenedor = Container(
            height: 80.0,
            width: MediaQuery.of(context).size.width * 0.70,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(color: Colors.green),
            ),
            decoration: BoxDecoration(
                border: Border(
              left: BorderSide(width: 1.0, color: Colors.grey),
              right: BorderSide(width: 1.0, color: Colors.grey),
            )),
          );
        } else {
          // print("DISTINTO: ${reserva.horarioDesdeNum} == ${hora.numero}");
          contenedor = Container(
            height: 80.0,
            width: MediaQuery.of(context).size.width * 0.70,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0)),
          );
        }

        return contenedor;
      }).toList(),
    );
  }
}
