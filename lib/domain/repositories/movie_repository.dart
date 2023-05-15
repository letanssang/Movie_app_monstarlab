import '../../data/remote/models/response/movie_response.dart';
import '../entities/movie/movie.dart';

abstract class MovieRepository {
  Future<MovieResponse> getTrendingMoviesWeek();

  Future<MovieResponse> getTrendingMoviesDay();

  Future<Movie> getMovieDetails(int id);

  Future<MovieResponse> getSimilarMovies(int id);

  Future<MovieResponse> getSearchSuggestList(String query);
}
