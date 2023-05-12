import 'package:movie_app/di/dependency_injection.dart';

import '../../data/repositories/movie_repository.dart';
import '../entities/movie/movie.dart';

class GetMovieDetailsUseCase {
  Future<Movie> run(int id) async {
    return getIt<MovieRepository>().getMovieDetails(id);
  }
}
