import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/services/movies.dart';
import 'package:movie_app/ui/movie_detail_page/view_model/movie_detail_state.dart';

import '../../../data/models/genre/genre.dart';
import '../../../data/models/movie/movie.dart';
import '../../fetch_state.dart';

final movieDetailProvider =
    StateNotifierProvider.autoDispose<MovieDetailViewModel, MovieDetailState>(
        (ref) => MovieDetailViewModel(ref));

class MovieDetailViewModel extends StateNotifier<MovieDetailState> {
  Ref ref;

  MovieDetailViewModel(this.ref) : super(const MovieDetailState(
  ));

  Future<void> initMovie(int id) async {
    final isFavorite = ref.read(moviesProvider.notifier).isFavorite(id);
    const baseUrl = 'https://api.themoviedb.org/3';
    const apiKey = '7ff74d3989927d3ca53bdc4d16facfe9';
    String endpoint = '/movie/$id';
    String endpointSimilar = '/movie/$id/similar';
    final dio = Dio();
    final response = await dio.get('$baseUrl$endpoint', queryParameters: {
      'api_key': apiKey,
    });
    final responseSimilar = await dio.get('$baseUrl$endpointSimilar',
        queryParameters: {
          'api_key': apiKey,
        });
    if (response.statusCode == 200) {
      final data = response.data;
      final movie = Movie.fromJson(data);
      final List<dynamic> genresList = data['genres'];
      List<String> genres =
      genresList.map((genre) => genre['name'].toString()).toList();

      final List<dynamic> similarMoviesList = responseSimilar.data['results'];
      List<Movie> similarMovies =
          similarMoviesList.map((e) => Movie.fromJson(e)).toList();
      similarMovies = similarMovies.where((element) => element.posterPath != '' && element.posterPath != '').toList();
      state = state.copyWith(
          movie: movie, genres: genres,
          similarMovies: similarMovies,
          isFavorite: isFavorite,
          fetchState: FetchState.success
      );
    } else {
      state = state.copyWith(fetchState: FetchState.error);
    }
  }
  void onTapFavorite() {
    state = state.copyWith(isFavorite: !state.isFavorite);
    ref.read(moviesProvider.notifier).toggleFavorite(state.movie.id!);
}
}
