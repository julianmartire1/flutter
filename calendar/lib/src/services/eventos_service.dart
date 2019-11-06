import 'package:http/http.dart' as http;
import 'dart:convert';

class EventoServices {
  Future<Map<DateTime, List>> getEventos() async {
    final url =
        'https://52a105d0-69dc-4d16-a0e6-db7d5f79eade.mock.pstmn.io/probando';
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
