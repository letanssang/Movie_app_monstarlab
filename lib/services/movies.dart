import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';

import '../data/models/movie/movie.dart';
final moviesProvider = StateNotifierProvider<MoviesState, List<Movie>>((ref) {
  final state = MoviesState();
  state.readJson();
  return state;
});

class MoviesState extends StateNotifier<List<Movie>> {
  MoviesState() : super([]);

  Future<void> readJson() async {
    final String response =
    await rootBundle.loadString('assets/json/data.json');
    final data = await json.decode(response);
    List<dynamic> list = data['results'];
    state = list.map((e) => Movie.fromJson(e)).toList();
  }

  Movie findById(int id) {
    return state.firstWhere((element) => element.id == id);
  }
}