import '../entities/movie/movie.dart';

abstract class GetSearchSuggestListUseCase {
  Future<List<Movie>> run(String query);
}
