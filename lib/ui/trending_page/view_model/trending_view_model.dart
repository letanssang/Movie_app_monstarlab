import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/ui/trending_page/view_model/trending_state.dart';

import '../../../services/movies.dart';

final trendingProvider = StateNotifierProvider<TrendingViewModel, TrendingState>((ref) => TrendingViewModel(ref));
class TrendingViewModel extends StateNotifier<TrendingState> {
  Ref ref;
  TrendingViewModel(this.ref) : super(TrendingState(scrollController: ScrollController()));
  void scrollToTop() {
    if (state.scrollController.offset > 0) {
      state.scrollController.animateTo(
        0,
        duration: Duration(milliseconds: 100 * state.listSize),
        curve: Curves.easeOut,
      ).then((value) => updateIsOnTop(true));
    }

  }
  void initScrollController(ScrollController scrollController) {
    state = state.copyWith(scrollController: scrollController);
  }

  void updateIsOnTop(bool isOnTop) {
    state = state.copyWith(isOnTop: isOnTop);
  }

  void updateIsLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  void updateListSize(int listSize) {
    state = state.copyWith(listSize: listSize);
  }
Future<void> loadMoreMovies(BuildContext context, int maxSize) async {
  await Future.delayed(
    const Duration(seconds: 2),
  );
  if(state.listSize < maxSize - 5){
    updateListSize(state.listSize + 5);
  }else if(state.listSize > maxSize - 5){
    updateListSize(maxSize);
  }
  updateIsLoading(false);
}
Future<void> refreshMovies(BuildContext context) async {
  return Future.delayed(
    const Duration(seconds: 2),
      ref.read(moviesProvider.notifier).fetchMovies);
}
void onTapFavorite(int id){
  ref.watch(moviesProvider.notifier).toggleFavorite(id);
}
}