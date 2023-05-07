import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/ui/trending_page/view_model/trending_state.dart';

final trendingProvider = StateNotifierProvider<TrendingViewModel, TrendingState>((ref) => TrendingViewModel());
class TrendingViewModel extends StateNotifier<TrendingState> {
  TrendingViewModel() : super(TrendingState(scrollController: ScrollController()));
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
}