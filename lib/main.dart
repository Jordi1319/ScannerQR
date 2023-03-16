import 'package:flutter/material.dart';
import 'package:sqrreader/src/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QRReader',
      initialRoute: 'home',
      routes: {'home': (BuildContext context) => const HomePage()},
      theme: ThemeData(primarySwatch: Colors.deepPurple),
    );
  }
}
