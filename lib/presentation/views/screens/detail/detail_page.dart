import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/domain/enums/fetch_state.dart';

import '../../resources/color.dart';
import '../../widgets/movie_rating.dart';
import 'components/banner_image.dart';
import 'components/collection_grid_view.dart';
import 'components/genre_grid_view.dart';
import 'components/information_header_delegate.dart';
import 'components/text_header_delegate.dart';
import 'detail_state.dart';
import 'detail_view_model.dart';

final detailProvider =
    StateNotifierProvider.autoDispose<DetailViewModel, DetailState>(
        (ref) => DetailViewModel(ref));

class DetailPage extends ConsumerStatefulWidget {
  static const routeName = '/detail';

  const DetailPage({super.key});

  @override
  ConsumerState<DetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends ConsumerState<DetailPage> {
  int id = 0;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    id = ModalRoute.of(context)!.settings.arguments as int;
    ref.read(detailProvider.notifier).initMovie(id);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final state = ref.watch(detailProvider);

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: AppColors.mainColor,
        child: state.fetchState != FetchState.success
            ? const Center(child: CircularProgressIndicator())
            : NestedScrollView(
                controller: state.scrollController,
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      expandedHeight: height * 0.3,
                      flexibleSpace: BannerImage(
                        backdropPath: state.movie.backdropPath!,
                        posterPath: state.movie.posterPath!,
                      ),
                    ),
                    SliverPersistentHeader(
                        delegate: InformationHeaderDelegate(
                      movieInformation: movieInformation(context, state),
                      height: height * 0.4,
                    )),
                    SliverPersistentHeader(
                        delegate: TextHeaderDelegate('Maybe you like'))
                  ];
                },
                body: state.similarMovies.isEmpty
                    ? const Center(child: Text('No similar movies'))
                    : CollectionGridView(
                        movies: state.similarMovies,
                        onTap: (int id) {
                          ref.read(detailProvider.notifier).initMovie(id);
                          state.scrollController.jumpTo(0);
                        },
                      ),
              ),
      ),
    );
  }

  Widget movieInformation(BuildContext context, DetailState state) {
    return SizedBox(
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
                  MovieRating(voteAverage: state.movie.voteAverage!),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      state.movie.title!,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    state.movie.releaseDate!,
                    style: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed:
                              ref.read(detailProvider.notifier).onTapFavorite,
                          icon: Icon(
                            Icons.favorite,
                            size: 16,
                            color: state.isFavorite
                                ? const Color(0xFFBB7152)
                                : const Color(0xFFC1AEA6),
                          )),
                      Text(
                        state.isFavorite
                            ? (state.movie.voteCount! + 1).toString()
                            : state.movie.voteCount.toString(),
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        state.movie.overview!,
                        style: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold),
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
                  Flexible(child: GenreGridView(strings: state.genres)),
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        customButton('Watch', const Color(0xFFD19C4B)),
                        customButton('Download', const Color(0xFF24A640)),
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }

  Container customButton(String text, Color color) => Container(
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
