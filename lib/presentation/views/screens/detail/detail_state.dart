import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/domain/enums/fetch_state.dart';

import '../../../../domain/entities/movie/movie.dart';

part 'detail_state.freezed.dart';

@freezed
class DetailState with _$DetailState {
  const factory DetailState({
    @Default(FetchState.init) FetchState fetchState,
    @Default(Movie()) Movie movie,
    @Default([]) List<String> genres,
    @Default([]) List<Movie> similarMovies,
    @Default(false) bool isFavorite,
    required ScrollController scrollController,
  }) = _DetailState;
}
