import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavigationProvider = StateNotifierProvider.autoDispose<HomeState, int>((ref) => HomeState());
class HomeState extends StateNotifier<int> {
  HomeState() : super(0);

  void onBottomItemTapped(int index) {
    state = index;
  }
}