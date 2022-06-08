// To parse this JSON data, do
//
//     final movie = movieFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MovieReponse movieReponseFromJson(String str) =>
    MovieReponse.fromJson(json.decode(str));

String movieReponseToJson(MovieReponse data) => json.encode(data.toJson());

class MovieReponse {
  MovieReponse({
    required this.data,
  });

  final List<Movie> data;

  factory MovieReponse.fromJson(Map<String, dynamic> json) => MovieReponse(
        data: List<Movie>.from(json["data"].map((x) => Movie.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Movie {
  Movie({
    required this.id,
    required this.name,
    required this.rating,
    required this.description,
    required this.year,
  });

  final int id;
  final String name;
  final double rating;
  final String description;
  final int year;

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json["id"],
      name: json["name"],
      rating: json["rating"].toDouble(),
      description: json["description"],
      year: json["year"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "rating": rating,
        "description": description,
        "year": year,
      };
}
