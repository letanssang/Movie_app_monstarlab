import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/data/models/response/movie_response.dart';
import 'package:retrofit/retrofit.dart';
import '../data/models/genre/genre.dart';
import '../data/models/movie/movie.dart';
part 'movie_service.g.dart';
final movieServiceProvider = Provider<MovieService>((ref) {
  final dio = Dio();
  return MovieService(dio);
});
@RestApi(baseUrl: 'https://api.themoviedb.org/3')
abstract class MovieService {
  factory MovieService(Dio dio, {String baseUrl}) = _MovieService;
  @GET('/trending/movie/week')
  Future<MovieResponse> getTrendingMoviesWeek(
      @Query('api_key') String apiKey, @Query('page') int page);

  @GET('/trending/movie/day')
  Future<MovieResponse> getTrendingMoviesDay(
      @Query('api_key') String apiKey, @Query('page') int page);
  @GET('/movie/{id}')
  Future<Movie> getMovieDetails(
      @Path('id') int movieId,
      @Query('api_key') String apiKey,
      );
  @GET('/movie/{id}/similar')
  Future<MovieResponse> getSimilarMovies(
      @Path('id') int movieId,
      @Query('api_key') String apiKey,
      );
}