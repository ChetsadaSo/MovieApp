import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:movie/controllers/movie_controller.dart';
import 'package:movie/models/movie_model.dart';
import 'package:movie/services/movie_service.dart';
import 'package:movie/views/pages/movie_de.dart';

class MovieListPage extends StatelessWidget {
  MovieListPage({Key? key}) : super(key: key);

  final MovieController _controller = Get.put(MovieController(MovieService()));

  Row Rating(double rating) {
    return Row(
      children: [
        RatingBarIndicator(
          rating: rating,
          itemBuilder: (context, index) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          itemCount: 5,
          itemSize: 10.0,
          direction: Axis.horizontal,
        ),
        SizedBox(
          width: 10,
        ),
        Text('$rating'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(),
    );
  }

  SafeArea body() {
    return SafeArea(
        child: Column(
      children: [
        Expanded(
          child: FutureBuilder<List<Movie>>(
              future: _controller.loadMovie(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  return ListView.builder(
                      itemCount: _controller.ismovies.length,
                      itemBuilder: (context, index) {
                        return _buildCard(index, _controller.ismovies);
                      });
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ],
    ));
  }

  InkWell _buildCard(int index, List<Movie> movies) {
    return InkWell(
      onDoubleTap: () {
        Get.to(PostViewPage(index, movies));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: Image.network(
              "https://golang-api-basic.herokuapp.com/api/v1/movie/${index + 1}/image"),
          title: Text(movies[index].name),
          subtitle: Rating(movies[index].rating),
          trailing: Text(movies[index].year.toString()),
        ),
      ),
    );
  }

  AppBar appBar() => AppBar(title: Text("Movie"));
}
