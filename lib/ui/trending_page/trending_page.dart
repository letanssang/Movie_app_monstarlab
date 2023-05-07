import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/ui/trending_page/components/trending_item.dart';
import 'package:movie_app/ui/trending_page/view_model/trending_view_model.dart';

import '../../services/movies.dart';
class TrendingPage extends ConsumerWidget {
  static const routeName = '/trending';
  TrendingPage({super.key});
  // @override
  // void initState() {
  //   super.initState();
  //   _scrollController.addListener(() {
  //     if (_scrollController.position.pixels >
  //         _scrollController.position.minScrollExtent + 5) {
  //       setState(() {
  //         isOnTop = false;
  //       });
  //     }
  //     if (_scrollController.offset >= _scrollController.position.maxScrollExtent) {
  //       setState(() {
  //         isLoading = true;
  //       });
  //       _loadMoreMovies(context);
  //     }
  //   });
  // }
  // Future<void> _refreshMovies(BuildContext context) async {
  //   return Future.delayed(
  //     const Duration(seconds: 2),
  //   );
  // }
  // Future<void> _loadMoreMovies(BuildContext context) async {
  //   await Future.delayed(
  //     const Duration(seconds: 2),
  //   );
  //   setState(() {
  //     if(_listSize < Provider.of<Movies>(context, listen: false).movies.length - 5){
  //       _listSize += 5;
  //     }
  //     isLoading = false;
  //   });
  // }


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trendingWeek = ref.watch(moviesProvider).trendingWeek;
    final state = ref.watch(trendingProvider);
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double appBarHeight = AppBar().preferredSize.height;
    final double totalHeight = statusBarHeight + appBarHeight + 5;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF716850),
        title: const Text('Trending', style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),),
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
            child: ListView.builder(
                      controller: state.scrollController,
                      itemCount: state.listSize,
                      itemBuilder: (context, item){
                        return TrendingItem(
                          id: trendingWeek[item].id!,
                          title: trendingWeek[item].title!,
                          posterPath: trendingWeek[item].posterPath!,
                          overview: trendingWeek[item].overview!,
                          voteCount: trendingWeek[item].voteCount!,
                          voteAverage: trendingWeek[item].voteAverage!,
                        );
                      }),
            ),
          state.isLoading ? const Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                color: Colors.grey,

              ),
            ),
          ) : Container(),
        ],
      ),
      floatingActionButton: state.isOnTop ? null : Align(
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
                Text('TOP', style: TextStyle(fontSize: 8, color: Colors.black, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
