import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/ui/home_tab_page/view_model/home_tab_state.dart';

final homeTabViewModelProvider = StateNotifierProvider<HomeTabViewModel, HomeTabState>((ref) => HomeTabViewModel());
class HomeTabViewModel extends StateNotifier<HomeTabState> {
  HomeTabViewModel() : super(HomeTabState(pageController: PageController(initialPage: 1, viewportFraction: 0.65), currentPage: 0));

  void initPageController(PageController pageController) {
    state = state.copyWith(pageController: pageController);
  }

  void updateCurrentPage(double currentPage) {
    state = state.copyWith(currentPage: currentPage);
  }
}