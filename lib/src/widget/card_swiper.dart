import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/src/model/movie.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({Key? key, required this.movies}) : super(key: key);
  final List<Movie> movies;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
return movies.isEmpty
  ?  SizedBox(
    height: size.height,
    width: double.infinity,
    child: const Center(child: CircularProgressIndicator.adaptive()),
  )
  : Container(
      width: double.infinity,
      height: size.height / 2,
      color: Colors.red,
      child: Swiper(
          itemCount: movies.length,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.6,
          itemHeight: size.height * 0.4,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'details' ,arguments: movies[index]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                    fit: BoxFit.cover,
                    placeholder: const AssetImage('assets/no-image.jpg'),
                    image: NetworkImage(movies[index].fullPosterImg)),
              ),
            );
          }),
    );
  }
}
