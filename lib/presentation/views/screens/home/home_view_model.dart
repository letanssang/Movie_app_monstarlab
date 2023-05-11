import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_state.dart';

class HomeViewModel extends StateNotifier<HomeState> {
  HomeViewModel()
      : super(HomeState(
            pageController:
                PageController(initialPage: 1, viewportFraction: 0.65),
            currentPage: 0));

  void initPageController(PageController pageController) {
    state = state.copyWith(pageController: pageController);
  }

  void updateCurrentPage(double currentPage) {
    state = state.copyWith(currentPage: currentPage);
  }
}
