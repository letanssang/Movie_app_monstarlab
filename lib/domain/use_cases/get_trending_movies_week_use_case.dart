import '../../data/repositories/movie_repository.dart';
import '../../di/dependency_injection.dart';
import '../entities/movie/movie.dart';

class GetTrendingMoviesWeekUseCase {
  Future<List<Movie>> run() async {
    final trendingWeekResponse =
        await getIt<MovieRepository>().getTrendingMoviesWeek();
    return trendingWeekResponse.results;
  }
}
