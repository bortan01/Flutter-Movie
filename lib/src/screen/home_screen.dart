import 'package:flutter/material.dart';
import 'package:flutter_movie/src/provider/movie_provider.dart';
import 'package:flutter_movie/src/search/search_delegate.dart';
import 'package:flutter_movie/src/widget/card_swiper.dart';
import 'package:flutter_movie/src/widget/movie_slider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Peliculas en Cines"),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () =>showSearch(context: context, delegate: MovieSearDelegate()), icon: const Icon(Icons.search))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiper(movies: moviesProvider.onDisplayMovies),
            MovieSlider(
              peliculas: moviesProvider.popularMovies,
              titulo: 'Películas Populares',
              onNextPage: ()=> moviesProvider.getPopularMovies(),
            )
          ],
        ),
      ),
    );
  }
}
