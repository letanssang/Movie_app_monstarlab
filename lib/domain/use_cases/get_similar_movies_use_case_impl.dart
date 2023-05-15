import 'package:movie_app/domain/repositories/movie_repository.dart';

import '../entities/movie/movie.dart';
import 'get_similar_movies_use_case.dart';

class GetSimilarMoviesUseCaseImpl implements GetSimilarMoviesUseCase {
  final MovieRepository _movieRepository;

  GetSimilarMoviesUseCaseImpl(this._movieRepository);

  @override
  Future<List<Movie>> run(int id) async {
    final similarMoviesResponse = await _movieRepository.getSimilarMovies(id);
    final similarMovies = similarMoviesResponse.results
        .where(
            (element) => element.backdropPath != '' && element.posterPath != '')
        .toList();
    return similarMovies;
  }
}
