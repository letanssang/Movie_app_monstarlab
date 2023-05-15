import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/data/remote/movie_service.dart';
import 'package:movie_app/domain/use_cases/get_movie_details_use_case.dart';
import 'package:movie_app/domain/use_cases/get_movie_details_use_case_impl.dart';
import 'package:movie_app/domain/use_cases/get_search_suggest_list_use_case.dart';
import 'package:movie_app/domain/use_cases/get_similar_movies_use_case.dart';
import 'package:movie_app/domain/use_cases/get_trending_movies_day_use_case.dart';
import 'package:movie_app/domain/use_cases/get_trending_movies_day_use_case_impl.dart';
import 'package:movie_app/domain/use_cases/get_trending_movies_week_use_case.dart';
import 'package:movie_app/domain/use_cases/get_trending_movies_week_use_case_impl.dart';

import '../data/repositories/movie_repository_impl.dart';
import '../domain/repositories/movie_repository.dart';
import '../domain/use_cases/get_search_suggest_list_use_case_impl.dart';
import '../domain/use_cases/get_similar_movies_use_case_impl.dart';

final GetIt getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<MovieService>(() => MovieService(getIt<Dio>()));
  getIt.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(getIt<MovieService>()));
  getIt.registerLazySingleton<GetTrendingMoviesWeekUseCase>(
      () => GetTrendingMoviesWeekUseCaseImpl(getIt<MovieRepository>()));
  getIt.registerLazySingleton<GetTrendingMoviesDayUseCase>(
      () => GetTrendingMoviesDayUseCaseImpl(getIt<MovieRepository>()));
  getIt.registerLazySingleton<GetMovieDetailsUseCase>(
      () => GetMovieDetailsUseCaseImpl(getIt<MovieRepository>()));
  getIt.registerLazySingleton<GetSimilarMoviesUseCase>(
      () => GetSimilarMoviesUseCaseImpl(getIt<MovieRepository>()));
  getIt.registerLazySingleton<GetSearchSuggestListUseCase>(
      () => GetSearchSuggestListUseCaseImpl(getIt<MovieRepository>()));
}
