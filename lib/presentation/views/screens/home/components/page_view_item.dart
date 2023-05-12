import 'package:flutter/material.dart';

import '../../../../../domain/entities/movie/movie.dart';
import '../home_state.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.state,
    required this.trendingWeek,
  });

  final HomeState state;
  final List<Movie> trendingWeek;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: PageView.builder(
          controller: state.pageController,
          itemCount: 6,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed('/detail', arguments: trendingWeek[index].id);
              },
              onPanUpdate: (details) {
                if (details.delta.dx > 0) {
                  state.pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                } else if (details.delta.dx < 0) {
                  state.pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                }
              },
              child: AnimatedBuilder(
                animation: state.pageController,
                builder: (context, child) {
                  double value = state.pageController.position.haveDimensions
                      ? state.pageController.page! - index
                      : 0;
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
        ));
  }
}
