import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/controllers/movie_controller.dart';
import 'package:movie/services/movie_service.dart';
import 'package:movie/views/pages/movie_List.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Movie Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MovieListPage(),
    );
  }
}
