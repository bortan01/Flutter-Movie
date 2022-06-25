import 'package:flutter/material.dart';
import 'package:flutter_movie/src/model/movie.dart';

class MovieSlider extends StatefulWidget {
  const MovieSlider({
    Key? key,
    required this.peliculas,
    required this.onNextPage,
    this.titulo,
  }) : super(key: key);
  final List<Movie> peliculas;
  final String? titulo;
  final Function onNextPage;

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  final scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels + 500 >=
          scrollController.position.maxScrollExtent) {
        widget.onNextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: 260,
        color: Colors.green,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.titulo != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  widget.titulo!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            const SizedBox(height: 5),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: widget.peliculas.length,
                itemBuilder: (context, index) =>
                    _MoviePoster(pelicula: widget.peliculas[index]),
              ),
            ),
            SizedBox(height: heightScreen * 0.05)
          ],
        ),
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster({Key? key, required this.pelicula}) : super(key: key);

  final Movie pelicula;
  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    print("en build ");
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 130,
      height: heightScreen * 0.3,
      color: Colors.blue,
      child: Column(
        children: [
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: pelicula),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FadeInImage(
                  height: heightScreen * 0.25,
                  fit: BoxFit.cover,
                  placeholder: const AssetImage('assets/loading.gif'),
                  image: NetworkImage(pelicula.fullBackdropPath)),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            pelicula.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
