import 'package:movie_app/data/repositories/movie_repository.dart';
import 'package:movie_app/di/dependency_injection.dart';

import '../entities/movie/movie.dart';

class GetSearchSuggestListUseCase {
  Future<List<Movie>> run(String query) async {
    final searchSuggestListResponse =
        await getIt<MovieRepository>().getSearchSuggestList(query);
    final suggestList = searchSuggestListResponse.results
      ..where((element) =>
          element.backdropPath != '' && element.posterPath != '').toList();
    return suggestList;
  }
}
