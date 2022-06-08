import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:movie/controllers/movie_controller.dart';
import 'package:movie/services/movie_service.dart';
import 'package:movie/views/pages/movie_de.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);
  @override
  _MovieList createState() => _MovieList();
}

class _MovieList extends State<MovieList> {
  @override
  void initState() {
    LoadMovie();
    print('inttState');
    super.initState();
  }

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
        Expanded(child: GetX<MovieService>(builder: (controller) {
          var cout = 0;
          // print(controller.movie);
          cout = cout + 1;
          print(cout);
          var data = controller.movie;
          if (controller.movie.length != 0) {
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return _buildCard(index, data);
                });
          } else {
            return Column(
              children: [
                Center(
                  child: CircularProgressIndicator(),
                ),
              ],
            );
          }
        })),
      ],
    ));
  }

  InkWell _buildCard(int index, List<dynamic> data) {
    return InkWell(
      onDoubleTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PostViewPage(index, data)),
        );
        print('print');
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: Image.network(
              "https://golang-api-basic.herokuapp.com/api/v1/movie/${index + 1}/image"),
          title: Text("${data[index]["name"]}"),
          subtitle: Rating((data[index]['rating'])),
          trailing: Text(data[index]['year'].toString()),
        ),
      ),
    );
  }

  AppBar appBar() => AppBar(title: Text("Movie"));
}
