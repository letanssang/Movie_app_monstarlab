import '../models/response/movie_response.dart';
import '../remote/movie_service.dart';

class MovieRepository {
  MovieRepository(this.movieService);

  final MovieService movieService;

  Future<MovieResponse> getTrendingMoviesWeek(String apiKey, int page) async {
    return movieService.getTrendingMoviesWeek(apiKey, page);
  }
}
