import 'package:movie_app/data/repositories/movie_repository.dart';

import '../../di/dependency_injection.dart';
import '../entities/movie/movie.dart';

class GetSimilarMoviesUseCase {
  Future<List<Movie>> run(int id) async {
    final similarMoviesResponse =
        await getIt<MovieRepository>().getSimilarMovies(id);
    final similarMovies = similarMoviesResponse.results
        .where(
            (element) => element.backdropPath != '' && element.posterPath != '')
        .toList();
    return similarMovies;
  }
}
