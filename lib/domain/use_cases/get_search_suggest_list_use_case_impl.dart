import '../entities/movie/movie.dart';
import '../repositories/movie_repository.dart';
import 'get_search_suggest_list_use_case.dart';

class GetSearchSuggestListUseCaseImpl implements GetSearchSuggestListUseCase {
  final MovieRepository _movieRepository;

  GetSearchSuggestListUseCaseImpl(this._movieRepository);

  @override
  Future<List<Movie>> run(String query) async {
    final searchSuggestListResponse =
        await _movieRepository.getSearchSuggestList(query);
    final suggestList = searchSuggestListResponse.results
        .where(
            (element) => element.backdropPath != '' && element.posterPath != '')
        .toList();
    return suggestList;
  }
}
