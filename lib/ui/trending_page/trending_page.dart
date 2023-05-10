import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/ui/trending_page/components/trending_item.dart';
import 'package:movie_app/ui/trending_page/view_model/trending_state.dart';
import 'package:movie_app/ui/trending_page/view_model/trending_view_model.dart';

import '../../data/models/movie/movie.dart';
import '../../services/movies.dart';
import '../fetch_state.dart';

class TrendingPage extends ConsumerStatefulWidget {
  static const routeName = '/trending';

  const TrendingPage({super.key});

  @override
  ConsumerState<TrendingPage> createState() => _TrendingPageState();
}

class _TrendingPageState extends ConsumerState<TrendingPage> {
  late TrendingState state;
  late TrendingViewModel viewModel;
  late List<Movie> trending;
  late final TrendingType trendingType;
  String title = 'Trending';

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    trendingType = ModalRoute.of(context)!.settings.arguments as TrendingType;
    if (trendingType == TrendingType.week) {
      trending = ref.watch(moviesProvider).trendingWeek;
      title = 'Trending of Week';
    } else {
      trending = ref.watch(moviesProvider).trendingDay;
      title = 'List of Day';
    }
    state = ref.watch(trendingProvider);
    viewModel = ref.watch(trendingProvider.notifier);
    final scrollController = state.scrollController;
    scrollController.addListener(() {
      if (scrollController.position.pixels < 50) {
        viewModel.updateIsOnTop(true);
      } else {
        viewModel.updateIsOnTop(false);
      }
      if (scrollController.offset >=
          scrollController.position.maxScrollExtent) {
        viewModel.updateIsLoading(true);
        viewModel.loadMoreMovies(context, trending.length);
      }
    });
  }
  @override
  void dispose() {
    state.scrollController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    if(trendingType == TrendingType.week){
      trending = ref.watch(moviesProvider).trendingWeek;
    } else {
      trending = ref.watch(moviesProvider).trendingDay;
    }
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double appBarHeight = AppBar().preferredSize.height;
    final double totalHeight = statusBarHeight + appBarHeight + 5;
    bool isFavorite(int id) {
      return ref.watch(moviesProvider.notifier).isFavorite(id);
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF716850),
        title: Text(
          title,
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 25),
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: const Color(0xFF716850),
            padding: EdgeInsets.only(bottom: state.isLoading ? 25 : 0),
            child: RefreshIndicator(
              onRefresh: () async {
                viewModel.refreshMovies(context);
              },
              child: ListView.builder(
                  controller: state.scrollController,
                  itemCount: ref.watch(trendingProvider).listSize,
                  itemBuilder: (context, index) {
                    return TrendingItem(
                        id: trending[index].id!,
                        title: trending[index].title!,
                        posterPath: trending[index].posterPath!,
                        overview: trending[index].overview!,
                        voteCount: isFavorite(trending[index].id!)
                            ? trending[index].voteCount! + 1
                            : trending[index].voteCount!,
                        voteAverage: trending[index].voteAverage!,
                        isFavorite: isFavorite(trending[index].id!),
                        onPressed: () {
                          ref
                              .read(trendingProvider.notifier)
                              .onTapFavorite(trending[index].id!);
                        });
                  }),
            ),
          ),
          ref.watch(trendingProvider).isLoading
              ? const Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: Colors.grey,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
      floatingActionButton: ref.watch(trendingProvider).isOnTop
          ? null
          : Align(
              alignment: Alignment.topCenter,
              child: InkWell(
                onTap: ref.read(trendingProvider.notifier).scrollToTop,
                child: Container(
                  margin: EdgeInsets.only(top: totalHeight),
                  width: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.arrow_circle_up),
                      Text('TOP',
                          style: TextStyle(
                              fontSize: 8,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
