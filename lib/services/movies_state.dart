import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';
import '../data/models/genre/genre.dart';
import '../data/models/movie/movie.dart';

part 'movies_state.freezed.dart';

@freezed
class MoviesState with _$MoviesState {
  const factory MoviesState({
    @Default([]) List<Movie> trendingWeek,
    @Default([]) List<Movie> trendingDay,
    @Default([]) List<Genre> genres,
    @Default([]) List<int> favoriteMovies,
  }) = _MoviesState;
}
