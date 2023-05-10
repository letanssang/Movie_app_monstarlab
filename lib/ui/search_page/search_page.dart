import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/services/movies.dart';
import 'package:movie_app/ui/fetch_state.dart';
import 'package:movie_app/ui/search_page/view_model/search_view_model.dart';
import 'package:movie_app/ui/trending_page/components/trending_item.dart';

class SearchPage extends ConsumerWidget {
  static const routeName = '/search';

  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final state = ref.watch(searchProvider);
    return SafeArea(
      child: Scaffold(
          body: Container(
        height: height,
        width: width,
        color: const Color(0xFF716850),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, left: 10, right: 10, bottom: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                        height: height * 0.05,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 5.0, left: 35),
                          child: TextField(
                            onChanged: (_) {
                              ref
                                  .read(searchProvider.notifier)
                                  .onChangeHandler();
                            },
                            onEditingComplete: () {
                              ref
                                  .read(searchProvider.notifier)
                                  .fetchSuggestList();
                            },
                            focusNode: state.focusNode,
                            controller: state.textEditingController,
                            style: const TextStyle(
                              color: Color(0xFFAEAEAE),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            cursorColor: const Color(0xFFD8AB0B),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        )),
                  ),
                  IconButton(
                      onPressed: () {
                        state.focusNode.unfocus();
                        Navigator.of(context).pop();
                      },
                      icon: SvgPicture.asset(
                        'assets/images/cancel.svg',
                        height: 30,
                        width: 30,
                      )),
                ],
              ),
            ),
            if (state.fetchState != FetchState.init)
              Container(
                  child: state.fetchState == FetchState.success
                      ? Expanded(
                          child: ListView.builder(
                              itemCount: state.suggestions.length,
                              itemBuilder: (context, index) {
                                return TrendingItem(
                                  id: state.suggestions[index].id!,
                                  title: state.suggestions[index].title!,
                                  posterPath:
                                      state.suggestions[index].posterPath!,
                                  overview: state.suggestions[index].overview!,
                                  voteAverage:
                                      state.suggestions[index].voteAverage!,
                                  voteCount:
                                      state.suggestions[index].voteCount!,
                                 isSearching: true,
                                );
                              }))
                      : const CircularProgressIndicator()),
          ],
        ),
      )),
    );
  }
}
