import 'package:get/get.dart';
import 'package:movie/models/movie_model.dart';
import 'package:movie/services/movie_service.dart';

class MovieController extends GetxController {
  MovieController(this._service);

  final MovieService _service;
  List<Movie> movies = <Movie>[].obs;
  Future<List<Movie>> loadMovie() async {
    movies = await _service.fetchMovie();
    return movies;
  }
}
