import '../../data/repositories/movie_repository.dart';
import '../../di/dependency_injection.dart';
import '../entities/movie/movie.dart';

class GetTrendingMoviesDayUseCase {
  Future<List<Movie>> run() async {
    final trendingDayResponse =
        await getIt<MovieRepository>().getTrendingMoviesWeek();
    return trendingDayResponse.results;
  }
}
