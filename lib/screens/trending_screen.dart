import 'package:flutter/material.dart';
import 'package:movie_app/widgets/trending_item.dart';
import 'package:provider/provider.dart';

import '../models/movies.dart';

class TrendingScreen extends StatefulWidget {
  static const routeName = '/trending';
  const TrendingScreen({Key? key}) : super(key: key);

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  bool isOnTop = true;
  bool isLoading = false;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >
          _scrollController.position.minScrollExtent + 5) {
        setState(() {
          isOnTop = false;
        });
      }
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {
          isLoading = true;
        });
        _loadMoreMovies(context);
      }
    });
  }
  Future<void> _refreshMovies(BuildContext context) async {
    return Future.delayed(
      const Duration(seconds: 2),
    );
  }
  Future<void> _loadMoreMovies(BuildContext context) async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    setState(() {
      isLoading = false;
    });
  }
  void _scrollToTop() {
    if (_scrollController.offset > 0) {
      _scrollController.animateTo(
        0,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      ).then((value) => setState(() {
        isOnTop = true;
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double appBarHeight = AppBar().preferredSize.height;
    final double totalHeight = statusBarHeight + appBarHeight + 5;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF716850),
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
            color: Color(0xFF716850),
            padding: EdgeInsets.only(bottom: 25),
            child: Consumer<Movies>(
              builder: (context,movies, _){
                return movies.movies.isEmpty
                    ? const CircularProgressIndicator()
                    : RefreshIndicator(
                  onRefresh: () => _refreshMovies(context),
                  child: ListView.builder(
                      controller: _scrollController,
                      itemCount: movies.movies.length,
                      itemBuilder: (context, item){
                        return TrendingItem(
                          id: movies.movies[item].id!,
                          title: movies.movies[item].title!,
                          posterPath: movies.movies[item].posterPath!,
                          overview: movies.movies[item].overview!,
                          voteCount: movies.movies[item].voteCount!,
                          voteAverage: movies.movies[item].voteAverage!,
                        );
                      }),
                );
              },
            ),
          ),
          isLoading ? Align(
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
      floatingActionButton: isOnTop ? null : Align(
        alignment: Alignment.topCenter,
        child: InkWell(
          onTap: _scrollToTop,
          child: Container(
            margin: EdgeInsets.only(top: totalHeight),
            width: 40,
            decoration: BoxDecoration(
              color: Color(0xFFD9D9D9),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Icon(Icons.arrow_circle_up),
                Text('TOP', style: TextStyle(fontSize: 8, color: Colors.black, fontWeight: FontWeight.bold))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
