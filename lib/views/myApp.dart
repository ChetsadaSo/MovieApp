import 'package:flutter/material.dart';
import 'package:movie/views/pages/movie_List.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MovieList(),
    );
  }
}
