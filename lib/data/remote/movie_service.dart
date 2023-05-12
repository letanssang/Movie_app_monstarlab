import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../domain/entities/movie/movie.dart';
import 'models/response/movie_response.dart';

part 'movie_service.g.dart';

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
    @Path('id') int id,
    @Query('api_key') String apiKey,
  );

  @GET('/movie/{id}/similar')
  Future<MovieResponse> getSimilarMovies(
    @Path('id') int id,
    @Query('api_key') String apiKey,
  );

  @GET('/search/movie')
  Future<MovieResponse> getSearchSuggestList(@Query('query') String query,
      @Query('api_key') String apiKey, @Query('page') int page);
}
