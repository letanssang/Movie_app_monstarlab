import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:dio/dio.dart';
import '../data/models/movie/movie.dart';
import 'movies_state.dart';
final moviesProvider = StateNotifierProvider<MoviesViewModel, MoviesState>((ref) {
  return MoviesViewModel();
});

class MoviesViewModel extends StateNotifier<MoviesState> {
  
  MoviesViewModel() : super(const MoviesState()) {
    fetchMovies();
  }

  // Future<void> readJson() async {
  //   final String response =
  //   await rootBundle.loadString('assets/json/data.json');
  //   final data = await json.decode(response);
  //   List<dynamic> list = data['results'];
  //   state = list.map((e) => Movie.fromJson(e)).toList();
  // }

  Future<void> fetchMovies() async {
    const baseUrl = 'https://api.themoviedb.org/3';
    const apiKey = '7ff74d3989927d3ca53bdc4d16facfe9';
    const endpointWeek = '/trending/movie/week';
    const endpointDay = '/trending/movie/day';
    const page = 1;
    final dio = Dio();
    final responseWeek = await dio.get(
        '$baseUrl$endpointWeek',queryParameters: {
      'api_key': apiKey,
      'page': page.toString(),
    }
    );
    final responseDay = await dio.get(
        '$baseUrl$endpointDay',queryParameters: {
      'api_key': apiKey,
      'page': page.toString(),
    }
    );
    if (responseWeek.statusCode == 200 && responseDay.statusCode == 200) {
      final List<dynamic> dataWeek = responseWeek.data['results'];
      final List<dynamic> dataDay = responseDay.data['results'];
      print(dataWeek);
      print(dataDay);
      state = state.copyWith(
          trendingWeek: dataWeek.map((e) => Movie.fromJson(e)).toList(),
          trendingDay: dataDay.map((e) => Movie.fromJson(e)).toList()
      );
    } else {
      throw Exception('Failed to fetch movies');
    }
  }


  Movie findById(int id) {
    return state.trendingWeek.firstWhere((element) => element.id == id);
  }
}