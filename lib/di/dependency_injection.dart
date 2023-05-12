import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/data/remote/movie_service.dart';
import 'package:movie_app/data/repositories/movie_repository.dart';
import 'package:movie_app/domain/use_cases/get_movie_details_use_case.dart';
import 'package:movie_app/domain/use_cases/get_search_suggest_list_use_case.dart';
import 'package:movie_app/domain/use_cases/get_similar_movies_use_case.dart';
import 'package:movie_app/domain/use_cases/get_trending_movies_day_use_case.dart';
import 'package:movie_app/domain/use_cases/get_trending_movies_week_use_case.dart';

final GetIt getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<MovieRepository>(MovieRepository());
  getIt.registerSingleton<GetTrendingMoviesWeekUseCase>(
      GetTrendingMoviesWeekUseCase());
  getIt.registerSingleton<GetTrendingMoviesDayUseCase>(
      GetTrendingMoviesDayUseCase());
  getIt.registerSingleton<GetMovieDetailsUseCase>(GetMovieDetailsUseCase());
  getIt.registerSingleton<GetSimilarMoviesUseCase>(GetSimilarMoviesUseCase());
  getIt.registerSingleton<GetSearchSuggestListUseCase>(
      GetSearchSuggestListUseCase());
  getIt.registerSingleton<MovieService>(MovieService(getIt<Dio>()));
}
