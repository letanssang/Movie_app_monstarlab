import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/data/remote/movie_service.dart';
import 'package:movie_app/domain/enums/fetch_state.dart';

import '../../../../domain/entities/movie/movie.dart';
import 'search_state.dart';

class SearchViewModel extends StateNotifier<SearchState> {
  final MovieService _movieService;

  SearchViewModel(MovieService movieService)
      : _movieService = movieService,
        super(SearchState(
            textEditingController: TextEditingController(),
            focusNode: FocusNode()));

  Future<void> fetchSuggestList() async {
    final query = state.textEditingController.value.text;
    if (query == '') {
      return;
    }
    const apiKey = '7ff74d3989927d3ca53bdc4d16facfe9';
    const page = 1;
    try {
      final suggestResponse =
          await _movieService.getSearchSuggestList(query, apiKey, page);
      final suggestions = suggestResponse.results
          .where((element) =>
              element.posterPath != '' && element.backdropPath != '')
          .toList();
      state = state.copyWith(
          suggestions: suggestions, fetchState: FetchState.success);
      state.focusNode.unfocus();
    } catch (e) {
      state = state.copyWith(fetchState: FetchState.error);
      throw Exception('Failed to fetch movies');
    }
  }

  void updateSuggestions(List<Movie> suggestions) {
    state = state.copyWith(suggestions: suggestions);
  }

  void onChangeHandler() {
    state = state.copyWith(
      fetchState: FetchState.loading,
    );
    const duration = Duration(milliseconds: 1000);
    if (state.searchOnStoppedTyping != null) {
      state.searchOnStoppedTyping!.cancel();
    }
    state = state.copyWith(
      searchOnStoppedTyping: Timer(duration, () => fetchSuggestList()),
    );
  }
}
