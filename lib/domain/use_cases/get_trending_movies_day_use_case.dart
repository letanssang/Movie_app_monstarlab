import '../entities/movie/movie.dart';

abstract class GetTrendingMoviesDayUseCase {
  Future<List<Movie>> run();
}
