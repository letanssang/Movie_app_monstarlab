import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/ui/fetch_state.dart';
import 'package:movie_app/ui/search_page/view_model/search_state.dart';

import '../../../data/models/movie/movie.dart';

final searchProvider = StateNotifierProvider.autoDispose<SearchViewModel, SearchState>(
    (ref) => SearchViewModel());

class SearchViewModel extends StateNotifier<SearchState> {
  SearchViewModel() : super(SearchState(
    textEditingController: TextEditingController(),
    focusNode: FocusNode()
  ));
   Future<void> fetchSuggestList() async {
     final query = state.textEditingController.value.text;
     if(query == ''){
       return;
     }
     const baseUrl = 'https://api.themoviedb.org/3';
     const apiKey = '7ff74d3989927d3ca53bdc4d16facfe9';
     const endpoint = '/search/movie';
     const page = 1;
     final dio = Dio();
     final response = await dio.get(
       '$baseUrl$endpoint', queryParameters: {
       'api_key': apiKey,
       'query': query,
       'page': page.toString(),
     }
     );
     if(response.statusCode == 200){
       final List<dynamic> listSuggest = response.data['results'];

       List<Movie> suggestions = listSuggest.map((e) => Movie.fromJson(e)).toList();
       suggestions = suggestions.where((element) => element.posterPath != '' && element.backdropPath != '').toList();
       state = state.copyWith(
         suggestions: suggestions,
         fetchState: FetchState.success
       );
       state.focusNode.unfocus();
     }else {
       state = state.copyWith(
         fetchState: FetchState.error
       );
     }
   }
  void updateSuggestions(List<Movie> suggestions) {
    state = state.copyWith(suggestions: suggestions);
  }
    void onChangeHandler() {
     state = state.copyWith(
       fetchState: FetchState.loading,
     );
      const duration = Duration(milliseconds: 1000); // Thiết lập thời gian chờ 1 giây trước khi gọi hàm search()
      if (state.searchOnStoppedTyping != null) {
        state.searchOnStoppedTyping!.cancel(); // Hủy bỏ timer trước đó nếu đã tồn tại
      }
      state = state.copyWith(
        searchOnStoppedTyping: Timer(duration, () =>
        fetchSuggestList()),
      );
    }


  }