import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/data/remote/movie_service.dart';

import '../../../../domain/entities/movie/movie.dart';
import '../../../../domain/enums/fetch_state.dart';
import '../../../base/movies.dart';
import 'detail_state.dart';

class DetailViewModel extends StateNotifier<DetailState> {
  final MovieService _movieService;
  Ref ref;

  DetailViewModel(this.ref, {required MovieService movieService})
      : _movieService = movieService,
        super(DetailState(
          scrollController: ScrollController(),
        ));

  Future<void> initMovie(int id) async {
    final isFavorite = ref.read(moviesProvider.notifier).isFavorite(id);
    const apiKey = '7ff74d3989927d3ca53bdc4d16facfe9';
    try {
      final movie = await _movieService.getMovieDetails(id, apiKey);
      final genresList = movie.genres!;
      List<String> genres = genresList.map((genre) => genre.name).toList();
      final similarMoviesResponse =
          await _movieService.getSimilarMovies(id, apiKey);
      final List<Movie> similarMovies = similarMoviesResponse.results
          .where((element) =>
              element.backdropPath != '' && element.posterPath != '')
          .toList();
      state = state.copyWith(
          movie: movie,
          genres: genres,
          similarMovies: similarMovies,
          isFavorite: isFavorite,
          fetchState: FetchState.success);
    } catch (error) {
      state = state.copyWith(fetchState: FetchState.error);
      throw Exception('Failed to fetch movies');
    }
  }

  void onTapFavorite() {
    state = state.copyWith(isFavorite: !state.isFavorite);
    ref.read(moviesProvider.notifier).toggleFavorite(state.movie.id!);
  }
}
