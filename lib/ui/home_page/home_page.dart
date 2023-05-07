import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:movie_app/ui/home_page/view_model/home_view_model.dart';

import '../../services/movies.dart';
import '../trending_page/trending_page.dart';

class HomePage extends ConsumerWidget {
  HomePage({Key? key});

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   _pageController.addListener(() {
  //     setState(() {
  //       _currentPage = _pageController.page!;
  //     });
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trendingWeek = ref.watch(moviesProvider).trendingWeek;
    final trendingDay = ref.watch(moviesProvider).trendingDay;
    final state = ref.watch(homeViewModelProvider);
    final pageController = state.pageController;
    pageController.addListener(() {
      ref.read(homeViewModelProvider.notifier).updateCurrentPage(pageController.page!);
    });
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF716850),
        title: TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(TrendingPage.routeName);
            },
            child: const Text('Trending',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold))),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.black, size: 25),
          ),
        ],
      ),
      body: trendingWeek.isEmpty
          ? const Center(child: CircularProgressIndicator())
          :
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Flexible(
          flex: 2,
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                controller: pageController,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/detail',
                          arguments: trendingWeek[index].id);
                    },
                    onPanUpdate: (details) {
                      if (details.delta.dx > 0) {
                        pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      } else if (details.delta.dx < 0) {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      }
                    },
                    child: AnimatedBuilder(
                      animation: pageController,
                      builder: (context, child) {
                        double value = pageController.position.haveDimensions ? pageController.page! - index : 0;
                        value = (1 - (value.abs() * 0.2)).clamp(0.0, 1.0);
                        return Transform.scale(
                          scale: value,
                          child: AspectRatio(
                            aspectRatio: 0.7,
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                vertical: 16,
                              ),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  'https://image.tmdb.org/t/p/w500${trendingWeek[index].posterPath}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              )

          ),
        ),
        Center(
          child: DotsIndicator(
              decorator: const DotsDecorator(
                size: Size(10, 10),
                color: Color(0xFFBD9E9E),
                activeColor: Color(0xFFF36464),
              ),
              position: state.currentPage,
              dotsCount: 6),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 16, bottom: 9),
          child: Text('List of Day',
              style:
              TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        Flexible(
          flex: 1,
          child: Container(
            margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.02),
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trendingDay.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/detail',
                      arguments: trendingDay[index].id);
                },
                child: AspectRatio(
                  aspectRatio: 0.625,
                  child: Container(
                    margin: const EdgeInsets.only(left: 11),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500${trendingDay[index].posterPath}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
