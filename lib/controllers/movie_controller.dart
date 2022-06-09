import 'package:get/get.dart';
import 'package:movie/models/movie_model.dart';
import 'package:movie/services/movie_service.dart';

class MovieController extends GetxController {
  MovieController(this._service);

  final MovieService _service;
  List<Movie> ismovies = <Movie>[].obs;
  Future<List<Movie>> loadMovie() async {
    ismovies = await _service.fetchMovie();
    return ismovies;
  }
}
