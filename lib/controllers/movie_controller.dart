import 'package:get/get.dart';
import 'package:movie/services/movie_service.dart';

final MovieService movieService = Get.put(MovieService());
@override
Future LoadMovie() {
  return movieService.fetchMovie();
}
