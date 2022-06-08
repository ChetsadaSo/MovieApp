import 'package:flutter/material.dart';

class PostViewPage extends StatefulWidget {
  int index;
  List<dynamic> movie;
  PostViewPage(this.index, this.movie);
  @override
  _PostViewPageState createState() => _PostViewPageState();
}

class _PostViewPageState extends State<PostViewPage> {
  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Movie'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Body(),
    );
  }

  ListView Body() {
    return ListView(children: [
      Container(
        child: Image.network(
            'https://golang-api-basic.herokuapp.com/api/v1/movie/${widget.movie[widget.index]['id']}/image'),
      ),
      Container(
        child: Text(
          widget.movie[widget.index]['name'],
          style: TextStyle(fontSize: 50),
        ),
      ),
      Container(
        child: Text(
          widget.movie[widget.index]['description'].toString(),
          style: TextStyle(fontSize: 20),
        ),
      ),
    ]);
  }
}
