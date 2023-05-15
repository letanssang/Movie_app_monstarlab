import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/domain/use_cases/get_movie_details_use_case.dart';
import 'package:movie_app/domain/use_cases/get_similar_movies_use_case.dart';

import '../../../../di/dependency_injection.dart';
import '../../../../domain/entities/movie/movie.dart';
import '../../../../domain/enums/fetch_state.dart';
import '../../../base/movies.dart';
import 'detail_state.dart';

class DetailViewModel extends StateNotifier<DetailState> {
  Ref ref;
  final GetMovieDetailsUseCase getMovieDetailsUseCase;

  DetailViewModel(this.ref, this.getMovieDetailsUseCase)
      : super(DetailState(
          scrollController: ScrollController(),
        ));

  Future<void> initMovie(int id) async {
    final isFavorite = ref.read(moviesProvider.notifier).isFavorite(id);
    try {
      final movie = await getMovieDetailsUseCase.run(id);
      List<String> genres = movie.genres!.map((genre) => genre.name).toList();
      final List<Movie> similarMovies =
          await getIt<GetSimilarMoviesUseCase>().run(id);

      state = state.copyWith(
          movie: movie,
          genres: genres,
          similarMovies: similarMovies,
          isFavorite: isFavorite,
          fetchState: FetchState.success);
    } catch (error) {
      if (!mounted) {
        return;
      }
      state = state.copyWith(fetchState: FetchState.error);
      throw Exception('Failed to fetch movies');
    }
  }

  void onTapFavorite() {
    state = state.copyWith(isFavorite: !state.isFavorite);
    ref.read(moviesProvider.notifier).toggleFavorite(state.movie.id!);
  }
}
