import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/ui/fetch_state.dart';

import '../../../data/models/movie/movie.dart';
part 'movie_detail_state.freezed.dart';
@freezed
class MovieDetailState with _$MovieDetailState {
  const factory MovieDetailState({
    @Default(FetchState.init) FetchState fetchState,
    @Default(Movie()) Movie movie,
    @Default([]) List<String> genres,
    @Default([]) List<Movie> similarMovies,
    @Default(false) bool isFavorite,
  }) = _MovieDetailState;
}