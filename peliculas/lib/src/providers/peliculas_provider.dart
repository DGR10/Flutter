

import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';

import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/models/actores_model.dart';

class PeliculasProvider {

  String _apikey = '6016ea44440e7ee65e09c22c0f907f58';
  String _url = 'api.themoviedb.org'; 
  String _languaje = 'es-ES';

  int _popularesPage = 0;
  bool _cargando = false; 

  List<Pelicula> _populares = new List();

  final _popularesStreamController = StreamController<List<Pelicula>>.broadcast(); // Broadcast puedo tener muchos lugar escuchando el mismo Stream

  Function(List<Pelicula>) get popularesSink => _popularesStreamController.sink.add;

  Stream<List<Pelicula>> get popularesStream => _popularesStreamController.stream;

  void disposeStreams() {
    _popularesStreamController?.close();
  }

  Future<List<Pelicula>> _procesarRespuesta(Uri url) async {
    // Hacemos la petición a la API
    final resp = await http.get(url);
    // Convertimos el json recibido en un Map
    final decodedData = json.decode(resp.body);
    // Barremos el Map y lo convertimos en una lista de peliculas
    final peliculas = new Peliculas.fromJsonList(decodedData['results']);
    // Devolvemos la lista
    return peliculas.items;
  }

  Future<List<Pelicula>> getEnCines() async {

    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key': _apikey,
      'languaje': _languaje
    });

    return await _procesarRespuesta(url);
  }

  Future<List<Pelicula>> getPopulares() async {

    if (_cargando) return [];

    _cargando = true;

    _popularesPage++;

    final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apikey,
      'languaje': _languaje,
      'page' : _popularesPage.toString()
    });

    final resp = await _procesarRespuesta(url);

    _populares.addAll(resp); // Agregamos las peliculas a la lista
    popularesSink(_populares);

    _cargando = false;
    return resp;
  }

  Future<List<Actor>> getCast( int peliId) async {

    final url = Uri.https(_url, '3/movie/$peliId/credits', {
      'api_key': _apikey,
      'languaje': _languaje
    });

    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);

    final cast = new Cast.fromJsonList(decodeData['cast']);

    return cast.actores;

  }

  Future<List<Pelicula>> buscarPelicula( String query) async {

    final url = Uri.https(_url, '3/search/movie', {
      'api_key': _apikey,
      'languaje': _languaje,
      'query': query
    });

    return await _procesarRespuesta(url);
  }
}