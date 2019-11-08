import 'package:http/http.dart' as http;
import 'dart:convert';

class EventoServices {
  Future<Map<DateTime, List>> getEventos() async {
    final url =
        'https://51eb21af-ab4c-49f2-9666-eb636ced713d.mock.pstmn.io/reservas';
    final resp = await http.get(url);
    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final Map<DateTime, List> eventos = Map<DateTime, List>();

    if (decodedData == null) return {};
    if (decodedData['error'] != null) return {};

    decodedData.forEach((i, value) {
      Map<DateTime, List> aux = Map<DateTime, List>();
      aux[DateTime.parse(i)] = value;
      eventos.addAll(aux);
    });

    print(eventos);

    return eventos;
  }
}
