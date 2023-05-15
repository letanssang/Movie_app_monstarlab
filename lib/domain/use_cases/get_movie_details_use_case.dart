import '../entities/movie/movie.dart';

abstract class GetMovieDetailsUseCase {
  Future<Movie> run(int id);
}
