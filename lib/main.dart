import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'presentation/views/screens/detail/detail_page.dart';
import 'presentation/views/screens/home/home_page.dart';
import 'presentation/views/screens/search/search_page.dart';
import 'presentation/views/screens/trending/trending_page.dart';

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
      home: const HomePage(),
      routes: {
        TrendingPage.routeName: (context) => const TrendingPage(),
        DetailPage.routeName: (context) => const DetailPage(),
        SearchPage.routeName: (context) => const SearchPage(),
      },
    );
  }
}
