import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:movie/models/movie_model.dart';

class MovieService extends GetxController {
  List movie = <Datum>[].obs;
  var isLoading = true.obs;
  Future<void> fetchMovie() async {
    var url = Uri.parse('https://golang-api-basic.herokuapp.com/api/v1/movies');
    var response = await http.get(url);
    var result = await json.decode(response.body);
    movie = result['data'];
    print("object");
  }
}
