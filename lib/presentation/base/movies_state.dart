import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/movie/movie.dart';

part 'movies_state.freezed.dart';

@freezed
class MoviesState with _$MoviesState {
  const factory MoviesState({
    @Default([]) List<Movie> trendingWeek,
    @Default([]) List<Movie> trendingDay,
    @Default([]) List<int> favoriteMovies,
  }) = _MoviesState;
}
