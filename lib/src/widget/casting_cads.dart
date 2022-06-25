import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/src/provider/movie_provider.dart';
import 'package:provider/provider.dart';

import '../model/credits_response.dart';

class CastingCads extends StatelessWidget {
  final int movieId;
  const CastingCads({Key? key, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final moviesProvider = Provider.of<MoviesProvider>(context);
    print("111111");
    return FutureBuilder(
      future: moviesProvider.getMovieCast(movieId),
      builder: (_, AsyncSnapshot<List<Cast>> snapshot) {
        print("222222");

        if (!snapshot.hasData) {
          return Container(
            margin: const EdgeInsets.only(bottom: 30),
            width: double.infinity,
            height: heightScreen * 0.40,
            child: const CupertinoActivityIndicator(),
          );
        }
        print("3333333");
        final List<Cast> casts = snapshot.data!;
        return Container(
          margin: const EdgeInsets.only(bottom: 30),
          width: double.infinity,
          height: heightScreen * 0.40,
          color: Colors.red,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => _CastCard(cast: casts[index]),
          ),
        );
      },
    );
  }
}

class _CastCard extends StatelessWidget {
  const _CastCard({Key? key, required this.cast}) : super(key: key);
  final Cast cast;

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widtScreen = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      color: Colors.green,
      width: widtScreen * 0.35,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              fit: BoxFit.cover,
              placeholder: const AssetImage('assets/loading.gif'),
              image: const NetworkImage('https://via.placeholder.com/200x300'),
              width: 100,
              height: heightScreen * 0.25,
            ),
          ),
          const SizedBox(height: 5.0),
          const Text(
            "Non labore amet aliquip pariatur officia do amet sit sit sunt anim aute.",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
