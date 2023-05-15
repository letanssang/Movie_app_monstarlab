import '../entities/movie/movie.dart';
import '../repositories/movie_repository.dart';
import 'get_trending_movies_week_use_case.dart';

class GetTrendingMoviesWeekUseCaseImpl implements GetTrendingMoviesWeekUseCase {
  final MovieRepository _movieRepository;

  GetTrendingMoviesWeekUseCaseImpl(this._movieRepository);

  @override
  Future<List<Movie>> run() async {
    final trendingWeekResponse = await _movieRepository.getTrendingMoviesWeek();
    return trendingWeekResponse.results;
  }
}
