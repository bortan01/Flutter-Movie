import 'package:flutter/material.dart';
import 'package:flutter_movie/src/model/now_playing_response.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  final String _apikey = '58ece4f5ea5201f6dc37d53153377fe5';
  final String _url = "api.themoviedb.org";
  final String _languaje = "es-ES";
  int _populares_page = 0;
   bool _cargando = false;
  // List<Pelicula> _populares = new List();

  // el list de peliculas hace referencia a que va a fluir al interior del stream
  // el broadcast es para que muchos lugares escuchando al stream
  // final _popularesStreamController =
  //     new StreamController<List<Pelicula>>.broadcast();

  // ///proceso para introducir peliculas
  // Function(List<Pelicula>) get popularesSink =>
  //     _popularesStreamController.sink.add;

  // ///para escuchar datos
  // Stream<List<Pelicula>> get popularesStream =>
  //     _popularesStreamController.stream;
//0.004855664
  // void disposeStreams() {
  //   _popularesStreamController.close();
  // }

  getOnDisplayMovies() async {
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key': _apikey,
      'language': _languaje,
    });
    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
  }

  // Future<List<Pelicula>> getPopulares() async {
  //   if(_cargando){
  //     return [];
  //   }
  //   _cargando =true;
  //   _populares_page++;
  //   print('cargando siguientes......');
  //   final url = Uri.https(_url, '3/movie/popular', {
  //     'api_key': _apikey,
  //     'language': _languaje,
  //     'page': _populares_page.toString(),
  //   });
  //   final resultado = await _procesarRespueta(url);

  //   _populares.addAll(resultado);
  //   popularesSink(_populares);
  //   _cargando= false;
  //   return resultado;
  // }

  // Future<List<Pelicula>> _procesarRespueta(Uri url) async {
  //   final respuesta = await http.get(url);
  //   final decodeData = json.decode(respuesta.body);

  //   // print(decodeData['results']);
  //   final peliculas = new Peliculas.fromJsonList(decodeData['results']);
  //   //(peliculas.items[1].title);
  //   return peliculas.items;
  // }

  // Future<List<Actor>> getCast(String peliId) async{
  //   final url = Uri.https(_url, '3/movie/$peliId/credits', {
  //     'api_key'  : _apikey,
  //     'language' : _languaje
  //   });

  //   final resp = await http.get(url);
  //   final decodedData = json.decode( resp.body );

  //   final cast = new Cast.fromJsonList(decodedData['cast']);

  //   return cast.actores;

  // }

  // Future<List<Pelicula>> buscarPelicula(String query) async {
  //   final url = Uri.https(_url, '3/search/movie', {
  //     'api_key': _apikey,
  //     'language': _languaje,
  //     'query' :query,
  //   });
  //   return await _procesarRespueta(url);
  // }

}