import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/data/models/movie/movie.dart';
import 'package:movie_app/ui/fetch_state.dart';
part 'search_state.freezed.dart';
@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    Timer? searchOnStoppedTyping,
    @Default(FetchState.init) FetchState fetchState,
    required TextEditingController textEditingController,
    required FocusNode focusNode,
    @Default([]) List<Movie> suggestions,
  }) = _SearchState;
}