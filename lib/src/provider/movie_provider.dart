import 'package:flutter/material.dart';

class MoviesProvider extends ChangeNotifier{
  
  MoviesProvider(){
    print("provider init");
  getOnDisplayMovies();
  }

  Future<void> getOnDisplayMovies() async {
    print("on displau");
  }

}