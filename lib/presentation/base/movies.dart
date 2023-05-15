import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../di/dependency_injection.dart';
import '../../domain/entities/movie/movie.dart';
import '../../domain/use_cases/get_trending_movies_day_use_case.dart';
import '../../domain/use_cases/get_trending_movies_week_use_case.dart';
import 'movies_state.dart';

final moviesProvider =
    StateNotifierProvider<MoviesViewModel, MoviesState>((ref) {
  return MoviesViewModel(getIt<GetTrendingMoviesWeekUseCase>(),
      getIt<GetTrendingMoviesDayUseCase>());
});

class MoviesViewModel extends StateNotifier<MoviesState> {
  final GetTrendingMoviesWeekUseCase getTrendingMoviesWeekUseCase;
  final GetTrendingMoviesDayUseCase getTrendingMoviesDayUseCase;

  MoviesViewModel(
      this.getTrendingMoviesWeekUseCase, this.getTrendingMoviesDayUseCase)
      : super(const MoviesState()) {
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    try {
      final trendingWeek = await getTrendingMoviesWeekUseCase.run();
      final trendingDay = await getTrendingMoviesDayUseCase.run();
      state = state.copyWith(
        trendingWeek: trendingWeek,
        trendingDay: trendingDay,
      );
    } catch (error) {
      throw Exception('Failed to fetch movies');
    }
  }

  void toggleFavorite(int id) {
    List<int> updatedFavorites = List.from(state.favoriteMovies);

    if (isFavorite(id)) {
      updatedFavorites.remove(id);
    } else {
      updatedFavorites.add(id);
    }
    state = state.copyWith(favoriteMovies: updatedFavorites);
  }

  bool isFavorite(int id) {
    return state.favoriteMovies.contains(id);
  }

  Movie findById(int id) {
    return state.trendingWeek.firstWhere((element) => element.id == id);
  }
}
