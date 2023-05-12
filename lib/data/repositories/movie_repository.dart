import 'package:movie_app/utils/constants/num.dart';
import 'package:movie_app/utils/constants/string.dart';

import '../../di/dependency_injection.dart';
import '../../domain/entities/movie/movie.dart';
import '../remote/models/response/movie_response.dart';
import '../remote/movie_service.dart';

class MovieRepository {
  Future<MovieResponse> getTrendingMoviesWeek() async {
    return getIt<MovieService>().getTrendingMoviesWeek(apiKey, page);
  }

  Future<MovieResponse> getTrendingMoviesDay() async {
    return getIt<MovieService>().getTrendingMoviesDay(apiKey, page);
  }

  Future<Movie> getMovieDetails(int id) async {
    return getIt<MovieService>().getMovieDetails(id, apiKey);
  }

  Future<MovieResponse> getSimilarMovies(int id) async {
    return getIt<MovieService>().getSimilarMovies(id, apiKey);
  }

  Future<MovieResponse> getSearchSuggestList(String query) async {
    return getIt<MovieService>().getSearchSuggestList(query, apiKey, page);
  }
}
