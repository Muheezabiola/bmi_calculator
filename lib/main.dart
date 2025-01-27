// ignore_for_file: prefer_const_constructors

import 'input_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Color.fromARGB(255, 194, 24, 91),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 5, 7, 16),
        ),
        scaffoldBackgroundColor: Color.fromARGB(255, 5, 7, 16),
      ),
      debugShowCheckedModeBanner: false,
      home: InputPage(),
    );
  }
}
