import 'package:flutter/material.dart';
import 'package:flutter_movie/src/provider/movie_provider.dart';
import 'package:flutter_movie/src/screen/details_screen.dart';
import 'package:flutter_movie/src/screen/home_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> MoviesProvider() )
      ],
      child: const MyApp(),
    );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Películas',
      initialRoute: 'home',
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          color: Colors.indigo
        )
      ),
      routes: {
        'home': (_) => const HomeScreen(),
        'details': (_) => const DetailsScreen()

      },
      
    );
  }
}