import 'package:flutter/material.dart';
import 'package:movie/models/movie_model.dart';

class PostViewPage extends StatefulWidget {
  int index;
  List<Movie> movie;
  PostViewPage(this.index, this.movie);
  @override
  _PostViewPageState createState() => _PostViewPageState();
}

class _PostViewPageState extends State<PostViewPage> {
  AppBar _buildAppBar() {
    return AppBar(
      title: Text(widget.movie[widget.index].name),
      backgroundColor: Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      backgroundColor: Colors.black,
    );
  }

  ListView _buildBody() {
    return ListView(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 450,
          width: 100,
          padding: EdgeInsets.all(2),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://golang-api-basic.herokuapp.com/api/v1/movie/${widget.movie[widget.index].id}/image')),
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Color.fromARGB(255, 39, 38, 38)),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Center(
            child: Text(
              widget.movie[widget.index].name,
              style: TextStyle(fontSize: 50, color: Colors.white),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Text(
            widget.movie[widget.index].description,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    ]);
  }
}
