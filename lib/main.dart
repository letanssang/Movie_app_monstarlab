import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/ui/home_page/home_page.dart';
import 'package:movie_app/ui/movie_detail_page/movie_detail_screen.dart';
import 'package:movie_app/ui/trending_page/trending_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ByteData data =
      await PlatformAssetBundle().load('assets/lets-encrypt-r3.pem');
  SecurityContext.defaultContext
      .setTrustedCertificatesBytes(data.buffer.asUint8List());
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          fontFamily: 'Roboto',
        ),
        title: 'My Movies App',
        home: HomePage(),
        routes: {
          TrendingScreen.routeName: (context) => TrendingScreen(),
          MovieDetailScreen.routeName: (context) => const MovieDetailScreen(),
        },
    );
  }
}

