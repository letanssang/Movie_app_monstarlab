import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/enums/trending_type.dart';
import '../../../base/movies.dart';
import '../trending/trending_page.dart';
import 'components/list_view_trending_day.dart';
import 'components/page_view_item.dart';
import 'home_state.dart';
import 'home_view_model.dart';

final homeViewModelProvider =
    StateNotifierProvider<HomeViewModel, HomeState>((ref) => HomeViewModel());

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trendingWeek = ref.watch(moviesProvider).trendingWeek;
    final trendingDay = ref.watch(moviesProvider).trendingDay;
    final state = ref.watch(homeViewModelProvider);
    state.pageController.addListener(() {
      ref
          .read(homeViewModelProvider.notifier)
          .updateCurrentPage(state.pageController.page!);
    });
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF716850),
        title: TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(TrendingPage.routeName,
                  arguments: TrendingType.week);
            },
            child: const Text('Trending',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold))),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/search');
            },
            icon: const Icon(Icons.search, color: Colors.black, size: 25),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color(0xFF716850),
        child: trendingWeek.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Flexible(
                  flex: 2,
                  child: PageViewItem(state: state, trendingWeek: trendingWeek),
                ),
                buildDotIndicator(state),
                Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 9),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(TrendingPage.routeName,
                          arguments: TrendingType.day);
                    },
                    child: const Text('List of Day',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: ListViewTrendingDay(trendingDay: trendingDay),
                ),
              ]),
      ),
    );
  }

  Center buildDotIndicator(HomeState state) {
    return Center(
      child: DotsIndicator(
          decorator: const DotsDecorator(
            size: Size(10, 10),
            color: Color(0xFFBD9E9E),
            activeColor: Color(0xFFF36464),
          ),
          position: state.currentPage,
          dotsCount: 6),
    );
  }
}
