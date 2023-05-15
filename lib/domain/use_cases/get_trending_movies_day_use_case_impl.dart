import '../entities/movie/movie.dart';
import '../repositories/movie_repository.dart';
import 'get_trending_movies_day_use_case.dart';

class GetTrendingMoviesDayUseCaseImpl implements GetTrendingMoviesDayUseCase {
  final MovieRepository _movieRepository;

  GetTrendingMoviesDayUseCaseImpl(this._movieRepository);

  @override
  Future<List<Movie>> run() async {
    final trendingDayResponse = await _movieRepository.getTrendingMoviesWeek();
    return trendingDayResponse.results;
  }
}
