import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'data/models/movie/movie.dart';

class Movies with ChangeNotifier {
  List<Movie> _movies = [];

  List<Movie> get movies => [..._movies];

  Future<void> readJson() async {
    final String response =
    await rootBundle.loadString('assets/json/data.json');
    final data = await json.decode(response);
    List<dynamic> list = data['results'];
    _movies = list.map((e) => Movie.fromJson(e)).toList();
    notifyListeners();
  }
  Movie findById(int id) {
    return _movies.firstWhere((element) => element.id == id);
  }
}