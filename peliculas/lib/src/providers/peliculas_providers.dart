import 'dart:convert';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:http/http.dart' as http;

class PeliculasProvider {
  String _apikey = 'cd84abf057948ad46cfb2d9750756874';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ARS';

  Future<List<Pelicula>> getEnCines() async {
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key': _apikey,
      'language': _language
    });

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final peliculas = Peliculas.fromJsonList(decodedData['results']);
    // print(peliculas.items[1].title);

    return peliculas.items;
  }
}