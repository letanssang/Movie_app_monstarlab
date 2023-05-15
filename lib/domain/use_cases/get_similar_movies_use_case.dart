import '../entities/movie/movie.dart';

abstract class GetSimilarMoviesUseCase {
  Future<List<Movie>> run(int id);
}
