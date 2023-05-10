
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/genre/genre.dart';
import '../data/models/movie/movie.dart';
import 'movie_service.dart';
import 'movies_state.dart';
final moviesProvider = StateNotifierProvider<MoviesViewModel, MoviesState>((ref) {
  return MoviesViewModel(
    movieService: ref.read(movieServiceProvider),
  );
});

class MoviesViewModel extends StateNotifier<MoviesState> {
  final MovieService _movieService;

  MoviesViewModel({required MovieService movieService})
      : _movieService = movieService,
        super(const MoviesState()) {
    fetchMovies();
  }
  Future<void> fetchMovies() async {
    const apiKey = '7ff74d3989927d3ca53bdc4d16facfe9';
    const page = 1;
    try {
      final trendingWeekResponse =
      await _movieService.getTrendingMoviesWeek(apiKey, page);
      final trendingWeek = trendingWeekResponse.results;
      final trendingDayResponse =
      await _movieService.getTrendingMoviesDay(apiKey, page);
      final trendingDay = trendingDayResponse.results;
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