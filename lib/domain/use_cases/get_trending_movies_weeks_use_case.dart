import '../../data/models/response/movie_response.dart';
import '../../data/remote/movie_service.dart';
import '../../data/repositories/movie_repository.dart';

class GetTrendingMoviesWeekUseCase {
  Future<MovieResponse> run(
      MovieService movieService, String apiKey, int page) async {
    final repository = MovieRepository(movieService);

    return repository.getTrendingMoviesWeek(apiKey, page);
  }
}
