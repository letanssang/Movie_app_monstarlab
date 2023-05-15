import '../entities/movie/movie.dart';

abstract class GetTrendingMoviesWeekUseCase {
  Future<List<Movie>> run();
}
