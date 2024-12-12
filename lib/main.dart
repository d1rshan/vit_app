import 'package:comeback/pages/glass_page.dart';
import 'package:comeback/pages/homepage.dart';
import 'package:comeback/pages/leetcode_page.dart';
import 'package:comeback/pages/time_table.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const GlassPage(),
      routes: {
        '/mess': (context) => const Homepage(),
        '/leetcode': (context) => const LeetcodePage(),
        '/glass_page': (context) => const GlassPage(),
        '/time_table': (context) => const TimeTable(),
      },
    );
  }
}
