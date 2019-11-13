import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:table_calendar_example/src/models/ReservaModel.dart';

class EventoServices {
  String _url = 'http://10.1.10.154:80/api';

  Future<Map<DateTime, List>> getEventos() async {
    try {
      final resp = await http.get("$_url/reservas");
      final Map<String, dynamic> decodedData = json.decode(resp.body);
      final Map<DateTime, List> eventos = Map<DateTime, List>();

      if (decodedData == null) return {};

      decodedData.forEach((i, value) {
        Map<DateTime, List> aux = Map<DateTime, List>();
        aux[DateTime.parse(i)] = value;
        eventos.addAll(aux);
      });

      print(eventos);

      return eventos;
    } catch (e) {
      print(e);
      return {};
    }
  }

  Future<List<ReservaModel>> getReservaDelDia(DateTime date) async {
      var resp =
          await http.post("$_url/reserva", body: {"date": date.toString()});
      final decodedData = json.decode(resp.body);
      final List<ReservaModel> reserva = List<ReservaModel>();
      print(decodedData);
      if (decodedData == null) return [];

      decodedData.forEach((i, value) {
        print(i);
        print(value);
      });
      return reserva;

    // print(reserva);
  }
}
