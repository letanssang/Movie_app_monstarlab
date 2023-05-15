import '../entities/movie/movie.dart';
import '../repositories/movie_repository.dart';
import 'get_movie_details_use_case.dart';

class GetMovieDetailsUseCaseImpl implements GetMovieDetailsUseCase {
  final MovieRepository _movieRepository;

  GetMovieDetailsUseCaseImpl(this._movieRepository);

  @override
  Future<Movie> run(int id) async {
    return _movieRepository.getMovieDetails(id);
  }
}
