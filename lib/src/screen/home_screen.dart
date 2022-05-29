import 'package:flutter/material.dart';
import 'package:flutter_movie/src/widget/card_swiper.dart';
import 'package:flutter_movie/src/widget/movie_slider.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Peliculas en Cines"),
        elevation: 0,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon( Icons.search_off_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            CardSwiper(),
            MovieSlider()
          ],
        ),
      ),
    );
  }
}