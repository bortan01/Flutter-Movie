import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_movie/src/helper/debouncer.dart';
import 'package:flutter_movie/src/model/credits_response.dart';
import 'package:flutter_movie/src/model/movie.dart';
import 'package:flutter_movie/src/model/now_playing_response.dart';
import 'package:flutter_movie/src/model/popiular_response.dart';
import 'package:flutter_movie/src/model/search_response.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  MoviesProvider() {
    getOnDisplayMovies();
    getPopularMovies();
  }

  final String _apikey = '58ece4f5ea5201f6dc37d53153377fe5';
  final String _url = "api.themoviedb.org";
  final String _languaje = "es-ES";
  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  int _popularesPage = 0;
  bool _cargando = false;
  Map<int, List<Cast>> moviesCast = {};
  final debauncer = Debouncer(duration: Duration(milliseconds: 500));

  final StreamController<List<Movie>> _suggestionStreamController =
      StreamController.broadcast();

  Stream<List<Movie>> get suggestionStream =>
      _suggestionStreamController.stream;

  Future<String> getJsonData({required String endPoing, int page = 1}) async {
    final url = Uri.https(_url, endPoing,
        {'api_key': _apikey, 'language': _languaje, 'page': page.toString()});
    final response = await http.get(url);
    return response.body;
  }

  Future<void> getOnDisplayMovies() async {
    final jsonData = await getJsonData(endPoing: '3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);
    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  Future<void> getPopularMovies() async {
    _popularesPage++;
    final jsonData =
        await getJsonData(endPoing: '3/movie/popular', page: _popularesPage);
    final popular = PopularResponse.fromJson(jsonData);
    popularMovies = [...popularMovies, ...popular.results];
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    if (moviesCast.containsKey(movieId)) return moviesCast[movieId]!;
    final jsonData = await getJsonData(endPoing: '3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson(jsonData);
    moviesCast[movieId] = creditsResponse.cast;
    return creditsResponse.cast;
  }

  Future<List<Movie>> searchMovies(String query) async {
    final url = Uri.https(_url, '3/search/movie',
        {'api_key': _apikey, 'language': _languaje, 'query': query});
    final response = await http.get(url);
    final searchResponse = SearchResponse.fromJson(response.body);
    return searchResponse.results;
  }

  void getSuggestionByQuery(String searchTerm) {
    debauncer.value = '';
    debauncer.onValue = (dynamic value) async {
      final valueString = value as String;
      if (valueString.length < 2) return;
      print("haciendo peticion" + valueString);
      final result = await searchMovies(valueString);
      _suggestionStreamController.add(result);
    };
    final timer = Timer.periodic(const Duration(milliseconds: 300), (_) {
      debauncer.value = searchTerm;
    });

    Future.delayed(const Duration(milliseconds: 301))
        .then((_) => timer.cancel());
  }
}
