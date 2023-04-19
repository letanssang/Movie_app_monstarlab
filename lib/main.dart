import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/screens/trending_screen.dart';
import './models/movies.dart';
import 'package:provider/provider.dart';
import 'screens/home_tab_screen.dart';
import 'screens/movies_tab_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ByteData data =
      await PlatformAssetBundle().load('assets/lets-encrypt-r3.pem');
  SecurityContext.defaultContext
      .setTrustedCertificatesBytes(data.buffer.asUint8List());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Movies(),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Roboto',
        ),
        title: 'My Movies App',
        home: MyHomePage(),
        routes: {
          TrendingScreen.routeName: (context) => const TrendingScreen()
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedBottomIndex = 0;

  @override
  void initState() {
    super.initState();
    Provider.of<Movies>(context, listen: false).readJson();
  }

  void _onBottomItemTapped(int index) {
    setState(() {
      _selectedBottomIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF716850),
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
        color: Color(0xFF716850),
        child: IndexedStack(
          index: _selectedBottomIndex,
          children: [
            const HomeTabScreen(),
            const MoviesTabScreen(),
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
          selectedItemColor: Color(0xFFF36464),
          unselectedItemColor: Color(0xFFB9B9B9),
          selectedIconTheme:
              const IconThemeData(color: Color(0xFFF36464), size: 35),
          unselectedIconTheme:
              const IconThemeData(color: Color(0xFFB9B9B9), size: 25),
          backgroundColor: Color(0xFF716850),
          currentIndex: _selectedBottomIndex,
          onTap: _onBottomItemTapped,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.movie),
              label: 'Movies',
            ),
          ],
        ),
      ),
    );
  }
}
