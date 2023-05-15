import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/utils/constants/num.dart';
import 'package:movie_app/utils/constants/string.dart';

import '../../domain/entities/movie/movie.dart';
import '../remote/models/response/movie_response.dart';
import '../remote/movie_service.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieService _movieService;

  MovieRepositoryImpl(this._movieService);

  @override
  Future<MovieResponse> getTrendingMoviesWeek() async {
    return _movieService.getTrendingMoviesWeek(apiKey, page);
  }

  @override
  Future<MovieResponse> getTrendingMoviesDay() async {
    return _movieService.getTrendingMoviesDay(apiKey, page);
  }

  @override
  Future<Movie> getMovieDetails(int id) async {
    return _movieService.getMovieDetails(id, apiKey);
  }

  @override
  Future<MovieResponse> getSimilarMovies(int id) async {
    return _movieService.getSimilarMovies(id, apiKey);
  }

  @override
  Future<MovieResponse> getSearchSuggestList(String query) async {
    return _movieService.getSearchSuggestList(query, apiKey, page);
  }
}
