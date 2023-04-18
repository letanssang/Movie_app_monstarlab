import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dots_indicator/dots_indicator.dart';
import '../models/movies.dart';

class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({Key? key}) : super(key: key);

  @override
  State<HomeTabScreen> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  final _pageController = PageController(initialPage: 1, viewportFraction: 0.8);
  double _currentPage = 1;
  @override
  void initState() {
    // TODO: implement initState
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<Movies>(
      builder: (context, movies, _) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Flexible(
          flex: 2,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
              controller: _pageController,
              itemCount: 6,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500${movies.movies[index].posterPath}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
        Center(
          child: DotsIndicator(
            decorator: DotsDecorator(
              color: Color(0xFFBD9E9E),
              activeColor: Color(0xFFF36464),
            ),
              position: _currentPage,
              dotsCount: 6),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 9),
          child: Text('List of Day', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        Flexible(
          flex: 1,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.movies.length,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(left: 11),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500${movies.movies[index].posterPath}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
