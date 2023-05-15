import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/domain/enums/fetch_state.dart';
import 'package:movie_app/domain/use_cases/get_search_suggest_list_use_case.dart';

import 'search_state.dart';

class SearchViewModel extends StateNotifier<SearchState> {
  final GetSearchSuggestListUseCase getSearchSuggestListUseCase;

  SearchViewModel(this.getSearchSuggestListUseCase)
      : super(SearchState(
            textEditingController: TextEditingController(),
            focusNode: FocusNode()));

  Future<void> fetchSuggestList() async {
    final query = state.textEditingController.value.text;
    if (query == '') {
      return;
    }
    try {
      final suggestions = await getSearchSuggestListUseCase.run(query);

      state = state.copyWith(
          suggestions: suggestions, fetchState: FetchState.success);
      state.focusNode.unfocus();
    } catch (e) {
      if (!mounted) {
        return;
      }
      state = state.copyWith(fetchState: FetchState.error);
      throw Exception('Failed to fetch movies');
    }
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
