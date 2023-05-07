import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../home_tab_page/home_tab_page.dart';
import '../movies_tab_page/movies_tab_page.dart';
import '../trending_page/trending_page.dart';
import 'view_model/home_view_model.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int selectedBottomIndex =  ref.watch(bottomNavigationProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF716850),
        title: TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(TrendingScreen.routeName);
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color(0xFF716850),
        child: IndexedStack(
          index: selectedBottomIndex,
          children: [
            HomeTabScreen(),
            const MoviesTabPage(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 10,
              spreadRadius: 0,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: BottomNavigationBar(
          elevation: 5,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: const Color(0xFFF36464),
          unselectedItemColor: const Color(0xFFB9B9B9),
          selectedIconTheme:
          const IconThemeData(color: Color(0xFFF36464), size: 35),
          unselectedIconTheme:
          const IconThemeData(color: Color(0xFFB9B9B9), size: 25),
          backgroundColor: const Color(0xFF716850),
          currentIndex: selectedBottomIndex,
          onTap: ref.read(bottomNavigationProvider.notifier).onBottomItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.movie),
              label: 'Movies',
            ),
          ],
        ),
      ),
    );
  }
}
