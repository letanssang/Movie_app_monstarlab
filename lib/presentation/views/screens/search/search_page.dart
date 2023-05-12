import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/domain/enums/fetch_state.dart';

import '../../resources/color.dart';
import '../../widgets/movie_listview_item.dart';
import 'search_state.dart';
import 'search_view_model.dart';

final searchProvider =
    StateNotifierProvider.autoDispose<SearchViewModel, SearchState>(
        (ref) => SearchViewModel());

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
        color: AppColors.mainColor,
        child: Column(
          children: [
            buildSearchBar(height, ref, state, context),
            if (state.fetchState != FetchState.init)
              Container(
                  child: state.fetchState == FetchState.success
                      ? Expanded(
                          child: ListView.builder(
                              itemCount: state.suggestions.length,
                              itemBuilder: (context, index) {
                                return MovieListViewItem(
                                  movie: state.suggestions[index],
                                  isSearching: true,
                                );
                              }))
                      : const CircularProgressIndicator()),
          ],
        ),
      )),
    );
  }

  Padding buildSearchBar(
      double height, WidgetRef ref, SearchState state, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 30),
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
                      ref.read(searchProvider.notifier).onChangeHandler();
                    },
                    onEditingComplete: () {
                      ref.read(searchProvider.notifier).fetchSuggestList();
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
    );
  }
}
