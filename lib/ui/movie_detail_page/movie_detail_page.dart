import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/ui/fetch_state.dart';
import 'package:movie_app/ui/movie_detail_page/components/collection_grid_view.dart';
import 'package:movie_app/ui/movie_detail_page/components/genre_grid_view.dart';
import 'package:movie_app/ui/movie_detail_page/view_model/movie_detail_view_model.dart';
import '../widgets/movie_rating.dart';
import 'components/banner_image.dart';

class MovieDetailPage extends ConsumerStatefulWidget {
  static const routeName = '/detail';

  const MovieDetailPage({super.key});

  @override
  ConsumerState<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends ConsumerState<MovieDetailPage> {
  int id = 0;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    id = ModalRoute.of(context)!.settings.arguments as int;
    ref.read(movieDetailProvider.notifier).initMovie(id);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(movieDetailProvider);
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Color(0xFF716850),
        ),
        child: state.fetchState != FetchState.success
            ? const Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                      child: BannerImage(
                    backdropPath: state.movie.backdropPath!,
                    posterPath: state.movie.posterPath!,
                  )),
                  Flexible(
                      child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MovieRating(
                                    voteAverage: state.movie.voteAverage!),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                    state.movie.title!,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  state.movie.releaseDate!,
                                  style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                        onPressed: ref
                                            .read(movieDetailProvider.notifier)
                                            .onTapFavorite,
                                        icon: Icon(
                                          Icons.favorite,
                                          size: 16,
                                          color: state.isFavorite
                                              ? const Color(0xFFBB7152)
                                              : const Color(0xFFC1AEA6),
                                        )),
                                    Text(
                                     state.isFavorite ?
                                     (state.movie.voteCount! + 1).toString()
                                         : state.movie.voteCount.toString(),
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Text(
                                      state.movie.overview!,
                                      style: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                            flex: 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Flexible(
                                    child:
                                        GenreGridView(strings: state.genres)),
                                Flexible(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      customButton(
                                          'Watch', const Color(0xFFD19C4B)),
                                      customButton(
                                          'Download', const Color(0xFF24A640)),
                                    ],
                                  ),
                                )
                              ],
                            ))
                      ],
                    ),
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      'Maybe you like',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Flexible(
                    child: state.similarMovies.isEmpty
                        ? const Center(child: Text('No similar movies'))
                        : CollectionGridView(
                            movies: state.similarMovies,
                      onTap: (int id) {
                              ref
                                  .read(movieDetailProvider.notifier)
                                  .initMovie(id);
                      },
                          ),
                  ),
                ],
              ),
      ),
    );
  }

  Container customButton(String text, Color color) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: TextButton(
            onPressed: () {},
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  fontFamily: 'Roboto'),
            )));
  }
}
