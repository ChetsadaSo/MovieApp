import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:movie/models/movie_model.dart';

class MovieService extends GetxController {
  Future<List<Movie>> fetchMovie() async {
    var url = Uri.parse('https://golang-api-basic.herokuapp.com/api/v1/movies');
    var response = await http.get(url);
    final MovieReponse movieResponse = movieReponseFromJson(response.body);
    return movieResponse.data;
  }
}
