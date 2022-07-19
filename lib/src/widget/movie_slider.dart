import 'package:flutter/material.dart';
import 'package:flutter_movie/src/model/movie.dart';

class MovieSlider extends StatefulWidget {
  const MovieSlider(
      {required this.peliculas,
      required this.onNextPage,
      this.titulo,
      Key? key})
      : super(key: key);
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
        height: heightScreen * 0.33,
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
                itemBuilder: (context, index) => _MoviePoster(
                    pelicula: widget.peliculas[index],
                    heroId:
                        '${widget.titulo}-$index-${widget.peliculas[index].id}'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster({Key? key, required this.pelicula, required this.heroId})
      : super(key: key);

  final Movie pelicula;
  final String heroId;
  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    pelicula.heroId = heroId;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 130,
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Hero(
            tag: pelicula.heroId!,
            child: GestureDetector(
              onTap: () {
                print(heroId);
                Navigator.pushNamed(context, 'details', arguments: pelicula);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FadeInImage(
                    fit: BoxFit.cover,
                    height: heightScreen * 0.20,
                    placeholder: const AssetImage('assets/loading.gif'),
                    image: NetworkImage(pelicula.fullPosterImg)),
              ),
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
