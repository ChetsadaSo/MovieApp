// To parse this JSON data, do
//
//     final movie = movieFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Movie movieFromJson(String str) => Movie.fromJson(json.decode(str));

String movieToJson(Movie data) => json.encode(data.toJson());

class Movie {
  Movie({
    required this.data,
  });

  final List<Datum> data;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
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
